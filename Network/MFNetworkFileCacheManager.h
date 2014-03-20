//
//  MFNetworkFileCacheManager.h
//  CMBFoundation
//
//  Created by Mac003 on 13-12-11.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MFNetworkFileCacheManager<NSObject>

- (void)cacheData: (NSData *)data
           withID: (NSString *)fileID;

- (NSData *)dataForFileID: (NSString *)fileID;

- (void)clearCache;


@end

@interface MFNetworkFileCacheManager : NSObject<MFNetworkFileCacheManager>

+ (id)defaultManager;

@end
