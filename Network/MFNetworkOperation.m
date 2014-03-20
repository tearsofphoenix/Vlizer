//
//  MFNetworkOperation.m
//  CMBFoundation
//
//  Created by Mac003 on 13-12-26.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "MFNetworkOperation.h"
#import "NSString+CMBExtensions.h"
#import "NSData+CMBExtensions.h"
#import "NSObject+GRExtensions.h"

@interface MFNetworkOperation ()<NSURLConnectionDataDelegate>
{
    NSMutableData *_receivedData;
    NSURLConnection *_connection;
}

@property (nonatomic, retain) NSDictionary *parameters;

@property (nonatomic, retain) NSURL *URL;

@property (nonatomic) NSTimeInterval lifeTimeInterval;

@property (nonatomic, copy) MFNetworkConnectionCallback callback;

@end

@implementation MFNetworkOperation

- (id)initWithURL: (NSURL *)URL
       parameters: (NSDictionary *)parameters
 lifeTimeInterval: (NSTimeInterval)lifeTimeInterval
         callback: (MFNetworkConnectionCallback)callback
{
    if ((self = [super init]))
    {
        _receivedData = [[NSMutableData alloc] init];
        
        [self setParameters: parameters];
        [self setURL: URL];
        [self setLifeTimeInterval: lifeTimeInterval];
        [self setCallback: callback];
    }
    
    return self;
}

- (void)dealloc
{    
    [_parameters release];
    [_receivedData release];
    [_URL release];
    [_connection release];
    
    if (_callback)
    {
        Block_release(_callback);
    }
    
    [_callbackThread release];
    
    [super dealloc];
}

- (void)_buildMultipartFormRequest: (NSMutableURLRequest *)request
                    withParameters: (NSDictionary *)parameters
{
    @autoreleasepool
    {
        [request setValue: @"application/x-www-form-urlencoded; charset=utf-8;"
       forHTTPHeaderField: @"Content-Type"];
        [request setValue: @"gzip"
       forHTTPHeaderField: @"Accept-Encoding"];
        
        NSMutableArray *parts = [NSMutableArray arrayWithCapacity: [_parameters count]];
        
        Class stringClass = [NSString class];
        Class arrayClass = [NSArray class];
        Class dictionaryClass = [NSDictionary class];
        
        [parameters enumerateKeysAndObjectsUsingBlock: (^(NSString *key, id obj, BOOL *stop)
                                                        {
                                                            if ([obj isKindOfClass: stringClass])
                                                            {
                                                                [parts addObject: [NSString stringWithFormat: @"%@=%@", key, obj]];
                                                                
                                                            }else if ([obj isKindOfClass: arrayClass]
                                                                      || [obj isKindOfClass: dictionaryClass])
                                                            {
                                                                [parts addObject: [NSString stringWithFormat: @"%@=%@", key, [obj JSONString]]];
                                                            }
                                                        })];
        
        NSString *str = [parts componentsJoinedByString: @"&"];
        NSData *data = [str dataUsingEncoding: NSUTF8StringEncoding];
        
        [request setHTTPBody: data];
        [request setValue: [NSString stringWithFormat:@"%u", [data length]]
       forHTTPHeaderField: @"Content-Length"];
    }
}

- (void)operationDidStart
{
    if (!_connection)
    {
        NSMutableURLRequest *reuqest = [NSMutableURLRequest requestWithURL: _URL];
        [reuqest setHTTPMethod: @"POST"];
        
        if ([_parameters count] > 0)
        {
            [self _buildMultipartFormRequest: reuqest
                              withParameters: _parameters];
        }
        
        _connection = [[NSURLConnection alloc] initWithRequest: reuqest
                                                      delegate: self
                                              startImmediately: YES];
    }
}

- (void)cancel
{
    [_connection cancel];
    
    [super cancel];
}

- (void)operationWillFinish
{
    [_delegate operationWillFinish: self];
}

- (NSData *)receivedData
{
    return _receivedData;
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection: (NSURLConnection *)connection
didReceiveResponse: (NSURLResponse *)response
{
    [_receivedData setLength: 0];
}

- (void)connection: (NSURLConnection *)connection
    didReceiveData: (NSData *)data
{
    [_receivedData appendData: data];
}

- (void)connection: (NSURLConnection *)connection
  didFailWithError: (NSError *)error
{
    [self finishWithError: error];
}

- (void)connectionDidFinishLoading: (NSURLConnection *)connection
{
    [self finishWithError: nil];
}

@end
