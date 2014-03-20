//
//  MFCacheManager.m
//  CMBFoundation
//
//  Created by Mac003 on 13-12-18.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "MFCacheManager.h"
#import "MFCacheManagerInternal.h"

@interface MFCacheManager ()
{
    id<MFCacheManager> _internal;
}
@end

@implementation MFCacheManager

static id gsCacheManager = nil;

+ (id)sharedManager
{
    if (!gsCacheManager)
    {
        gsCacheManager = [[self alloc] init];
    }
    
    return gsCacheManager;
}

- (id)init
{
    if (!gsCacheManager)
    {
        if ((self = [super init]))
        {
            _internal = [[MFCacheManagerInternal alloc] init];
        }
        
        return self;
    }
    
    return gsCacheManager;
}

- (void)dealloc
{
    [_internal release];
    
    [super dealloc];
}

- (void)addObject: (id)object
           forKey: (id<NSCopying>)key
         lifetime: (NSTimeInterval)lifetime
           toPool: (NSString *)poolID
{
    [_internal addObject: object
                  forKey: key
                lifetime: lifetime
                  toPool: poolID];
}

- (id)objectForKey: (id<NSCopying>)key
            inPool: (NSString *)poolID
{
    return [_internal objectForKey: key
                            inPool: poolID];
}

- (void)setLimitCount: (NSUInteger)limitCount
              forPool: (NSString *)poolID
{
    [_internal setLimitCount: limitCount
                     forPool: poolID];
}

- (NSUInteger)limitCountOfPool: (NSString *)poolID
{
    return [_internal limitCountOfPool: poolID];
}

@end
