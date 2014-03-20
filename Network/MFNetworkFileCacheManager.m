//
//  MFNetworkFileCacheManager.m
//  CMBFoundation
//
//  Created by Mac003 on 13-12-11.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "MFNetworkFileCacheManager.h"
#import "MFNetworkFileCacheManagerInternal.h"

@interface MFNetworkFileCacheManager ()
{
    id<MFNetworkFileCacheManager> _internal;
}
@end

@implementation MFNetworkFileCacheManager

static id gsNetworkFileCacheManager = nil;

+ (id)defaultManager
{
    if (!gsNetworkFileCacheManager)
    {
        gsNetworkFileCacheManager = [[self alloc] init];
    }
    
    return gsNetworkFileCacheManager;
}

+ (id)allocWithZone: (NSZone *)zone
{
    if (!gsNetworkFileCacheManager)
    {
        return [super allocWithZone: zone];
    }
    
    return nil;
}

- (id)init
{
    if (gsNetworkFileCacheManager)
    {
        [self doesNotRecognizeSelector: _cmd];
    }else
    {
        if ((self = [super init]))
        {
            _internal = [[MFNetworkFileCacheManagerInternal alloc] init];
        }
        
        return self;
    }
    
    return nil;
}

- (void)dealloc
{
    [_internal release];
    
    [super dealloc];
}

- (void)cacheData: (NSData *)data
           withID: (NSString *)fileID
{
   [_internal cacheData: data
                 withID: fileID];
}

- (NSData *)dataForFileID: (NSString *)fileID
{
    return [_internal dataForFileID: fileID];
}

- (void)clearCache
{
    [_internal clearCache];
}

@end
