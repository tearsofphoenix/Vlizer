//
//  MFNetworkClientInternal.m
//  CMBFoundation
//
//  Created by Mac003 on 13-12-27.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "MFNetworkClientInternal.h"
#import "MFNetworkOperation.h"
#import "MFCacheManager.h"
#import "MFNetworkFileCacheManager.h"

static NSString * const MFNetworkCachePoolID = @"cache.pool.network";
static NSUInteger MFNetworkTransferQueueCapacity = 6;

@interface MFNetworkClientInternal ()<MFNetworkOperationDelegate>
{
    NSMutableArray *_connections;
    NSMutableArray *_executingOperations;
    NSMutableDictionary *_connectionInformations;
    NSThread *_networkThread;
    NSOperationQueue *_networkTransferQueue;
}
@end

@implementation MFNetworkClientInternal

- (id)init
{
    if ((self = [super init]))
    {
        _connections = [[NSMutableArray alloc] init];
        _connectionInformations = [[NSMutableDictionary alloc] init];
        _executingOperations = [[NSMutableArray alloc] initWithCapacity: MFNetworkTransferQueueCapacity * 2];
        
        _networkTransferQueue = [[NSOperationQueue alloc] init];
        [_networkTransferQueue setMaxConcurrentOperationCount: MFNetworkTransferQueueCapacity];
        
        _networkThread = [[NSThread alloc] initWithTarget: self
                                                 selector: @selector(_networkThreadMain)
                                                   object: nil];
        
        [_networkThread setName: @"com.cmb.foundation.thread.network"];
        
        [_networkThread start];
    }
    
    return self;
}

- (void)dealloc
{
    [_executingOperations release];
    [_connections release];
    [_connectionInformations release];
    [_networkTransferQueue release];
    [_networkThread release];
    
    [super dealloc];
}

- (void)_networkThreadMain
{
    assert( ![NSThread isMainThread] );
    
    while (YES)
    {
        @autoreleasepool
        {
            [[NSRunLoop currentRunLoop] run];
        }
    }
    
    assert(NO);
}

- (void)_postConnectionToURL: (NSURL *)targetURL
                  parameters: (NSDictionary *)parameters
                    lifeTime: (NSTimeInterval)timeInterval
                    callback: (MFNetworkConnectionCallback)callback
{
    @synchronized (self)
    {
        if (!_connectionInformations[targetURL])
        {
            MFNetworkOperation *operation = [[MFNetworkOperation alloc] initWithURL: targetURL
                                                                         parameters: parameters
                                                                   lifeTimeInterval: timeInterval
                                                                           callback: callback];
            [operation setDelegate: self];
            [operation setRunLoopThread: _networkThread];
            [operation setCallbackThread: [NSThread currentThread]];
            
            [_connectionInformations setObject: operation
                                        forKey: targetURL];
            
            if ([_networkTransferQueue operationCount] < [_networkTransferQueue maxConcurrentOperationCount])
            {
                [_executingOperations addObject: operation];
                [_networkTransferQueue addOperation: operation];
            }else
            {
                [_connections addObject: operation];
            }
            
            [operation release];
        }
    }
}

- (void)addConnectionToURL: (NSURL *)targetURL
                  lifeTime: (NSTimeInterval)timeInterval
                  callback: (MFNetworkConnectionCallback)callback
{
    [self postToURL: targetURL
         parameters: nil
           lifeTime: timeInterval
           callback: callback];
}

- (void)postToURL: (NSURL *)targetURL
       parameters: (NSDictionary *)parameters
         lifeTime: (NSTimeInterval)timeInterval
         callback: (MFNetworkConnectionCallback)callback
{
    BOOL shouldPostConnection = YES;

    //check if in cache
    //
    if (timeInterval > 0)
    {
        NSData *cachedData =  [[MFCacheManager sharedManager] objectForKey: targetURL
                                                                inPool: MFNetworkCachePoolID];
        if (cachedData && callback)
        {
            shouldPostConnection = NO;
            
            callback(cachedData, nil);
        }
    }
    
    if (shouldPostConnection)
    {
        [self _postConnectionToURL: targetURL
                        parameters: parameters
                          lifeTime: timeInterval
                          callback: callback];
    }
}

- (void)downloadFileAtURL: (NSURL *)fileURL
                 callback: (MFNetworkConnectionCallback)callback
{
    if (fileURL)
    {
        NSString *filePath = [fileURL absoluteString];
        
        __block MFNetworkFileCacheManager *manager = [MFNetworkFileCacheManager defaultManager];
        NSData *data = [manager dataForFileID: filePath];
        if (data)
        {
            callback(data, nil);
        }else
        {
            [self _postConnectionToURL: fileURL
                            parameters: nil
                              lifeTime: 0
                              callback: (^(id result, id error)
                                         {
                                             if (!error)
                                             {
                                                 [manager cacheData: result
                                                             withID: filePath];
                                                 
                                                 if (callback)
                                                 {
                                                     callback(result, error);
                                                 }
                                             }
                                         })];
        }
    }
}

//If there are waiting operations and queue is not full,
//add a waiting operation to transfer queue
//
- (void)_scheduleQueueIfNeeded
{
    if ([_connections count] > 0 && [_networkTransferQueue operationCount] < MFNetworkTransferQueueCapacity)
    {
        MFNetworkOperation *waitingOperation = _connections[0];
        [_executingOperations addObject: waitingOperation];
        [_connections removeObjectAtIndex: 0];
        
        [_networkTransferQueue addOperation: waitingOperation];
    }
}

- (void)cancelRequestForURL: (NSURL *)targetURL
{
    @synchronized (self)
    {
        MFNetworkOperation *operation = _connectionInformations[targetURL];
        
        if (operation)
        {
            __block NSUInteger waitingIndex = NSNotFound;
            //is it still waiting?
            //
            [_connections enumerateObjectsUsingBlock: (^(MFNetworkOperation *obj, NSUInteger idx, BOOL *stop)
                                                       {
                                                           if (obj == operation)
                                                           {
                                                               waitingIndex = idx;
                                                               *stop = YES;
                                                           }
                                                       })];
            
            if (waitingIndex != NSNotFound)
            {
                [_connections removeObjectAtIndex: waitingIndex];
            }else
            {
                //it's running, so cancel it and remove from queue
                //
                [operation cancel];
                
                [_executingOperations removeObject: operation];
                [self _scheduleQueueIfNeeded];
            }
            
            [_connectionInformations removeObjectForKey: targetURL];
        }
    }
}

#pragma mark - Delegate

- (void)operationWillFinish: (MFNetworkOperation *)operation
{
    @synchronized (self)
    {
        NSError *error = [operation error];
        MFNetworkConnectionCallback callback = [operation callback];
        
        if (error)
        {
            if (callback)
            {
                callback(nil, error);
            }
        }else
        {
            NSURL *targetURL = [operation URL];
            
            //check if need save into memory cache
            //
            NSTimeInterval lifeTime = [operation lifeTimeInterval];
            NSData *receivedData = [operation receivedData];
            NSThread *callbackThread = [operation callbackThread];
            
            if (lifeTime > 0)
            {
                [[MFCacheManager sharedManager] addObject: receivedData
                                                   forKey: targetURL
                                                 lifetime: lifeTime
                                                   toPool: MFNetworkCachePoolID];
            }
            
            callback = Block_copy(callback);
            
            [self performSelector: @selector(_performOperationWithArguments:)
                         onThread: callbackThread
                       withObject: @[callback, receivedData]
                    waitUntilDone: NO];
            
            Block_release(callback);
        }
        
        [_connectionInformations removeObjectForKey: [operation URL]];
        [_executingOperations removeObject: operation];
        
        [self _scheduleQueueIfNeeded];
    }
}

- (void)_performOperationWithArguments: (NSArray *)arguments
{
    MFNetworkConnectionCallback callback = arguments[0];
    NSData *data = arguments[1];
    
    callback(data, nil);
}

@end
