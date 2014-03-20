//
//  MFCacheManager.h
//  CMBFoundation
//
//  Created by Mac003 on 13-12-18.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MFCacheManager <NSObject>

- (void)addObject: (id)object
           forKey: (id<NSCopying>)key
         lifetime: (NSTimeInterval)lifetime
           toPool: (NSString *)poolID;

- (id)objectForKey: (id<NSCopying>)key
            inPool: (NSString *)poolID;

- (void)setLimitCount: (NSUInteger)limitCount
              forPool: (NSString *)poolID;

- (NSUInteger)limitCountOfPool: (NSString *)poolID;

@end

@interface MFCacheManager : NSObject<MFCacheManager>

+ (id)sharedManager;

@end
