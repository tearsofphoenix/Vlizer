//
//  MFCacheManagerInternal.m
//  CMBFoundation
//
//  Created by Mac003 on 13-12-27.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "MFCacheManagerInternal.h"

static NSString * const MFCacheObjectKey = @"object";
static NSString * const MFCacheDeadLineKey = @"deadline";
static NSString * const MFCacheReferenceKey = @"reference-key";

@interface MFCacheManagerInternal ()
{
        NSMutableDictionary *_pools;
        NSMutableDictionary *_limits;
}
@end

@implementation MFCacheManagerInternal

- (id)init
{
        if ((self = [super init]))
        {
            _limits = [[NSMutableDictionary alloc] initWithCapacity: 16];
            _pools = [[NSMutableDictionary alloc] initWithCapacity: 16];
        }
        
        return self;
}

- (void)dealloc
{
    [_limits release];
    [_pools release];
    
    [super dealloc];
}

- (void)addObject: (id)object
           forKey: (id<NSCopying>)key
         lifetime: (NSTimeInterval)lifetime
           toPool: (NSString *)poolID
{
    NSMutableDictionary *pool = _pools[poolID];
    if (!pool)
    {
        pool = [[NSMutableDictionary alloc] initWithCapacity: 1024];
        [_pools setObject: pool
                   forKey: poolID];
        [pool release];
    }
    
    [pool setObject: (@{
                        MFCacheObjectKey : object,
                        MFCacheDeadLineKey : [NSDate dateWithTimeIntervalSinceNow: lifetime],
                        MFCacheReferenceKey : key,
                        })
             forKey: key];
}

- (id)objectForKey: (id<NSCopying>)key
            inPool: (NSString *)poolID
{
    NSMutableDictionary *pool = _pools[poolID];
    
    NSDictionary *info = pool[key];
    if (info)
    {
        NSDate *deadLineDate = info[MFCacheDeadLineKey];
        
        if ([deadLineDate timeIntervalSinceReferenceDate] > [NSDate timeIntervalSinceReferenceDate])
        {
            //is valid
            return info[MFCacheObjectKey];
        }else
        {
            //cached dead, so remove it
            [pool removeObjectForKey: key];
        }
    }
    
    return nil;
}

- (void)setLimitCount: (NSUInteger)limitCount
              forPool: (NSString *)poolID
{
    [_limits setObject: @(limitCount)
                forKey: poolID];
    
    //check if we need shrink the pool
    NSMutableDictionary *pool = _pools[poolID];
    NSUInteger count = [pool count];
    NSInteger diff = count - limitCount;
    
    if (diff > 0)
    {
        NSArray *sortedObjects = [[_pools allValues] sortedArrayUsingComparator:
                                  (^NSComparisonResult(NSDictionary *obj1, NSDictionary *obj2)
                                   {
                                       return [obj1[MFCacheDeadLineKey] compare: obj2[MFCacheDeadLineKey]];
                                   })];
        
        NSArray *objectsToRemove = [sortedObjects subarrayWithRange: NSMakeRange(0, diff)];
        NSMutableArray *keys = [NSMutableArray arrayWithCapacity: diff];
        
        for (NSDictionary *oLooper in objectsToRemove)
        {
            [keys addObject: oLooper[MFCacheReferenceKey]];
        }
        
        [pool removeObjectForKey: keys];
    }
}

- (NSUInteger)limitCountOfPool: (NSString *)poolID
{
    return [_limits[poolID] unsignedIntegerValue];
}

@end
