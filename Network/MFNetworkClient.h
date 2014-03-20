//
//  CMBNetworkClient.h
//  CMBNetwork
//
//  Created by Mac003 on 13-12-5.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ MFNetworkConnectionCallback)(NSData *data, id error);

@protocol MFNetworkClient <NSObject>

- (void)addConnectionToURL: (NSURL *)targetURL
                  lifeTime: (NSTimeInterval)timeInterval
                  callback: (MFNetworkConnectionCallback)callback;

- (void)postToURL: (NSURL *)targetURL
       parameters: (NSDictionary *)parameters
         lifeTime: (NSTimeInterval)timeInterval
         callback: (MFNetworkConnectionCallback)callback;

- (void)downloadFileAtURL: (NSURL *)fileURL
                 callback: (MFNetworkConnectionCallback)callback;

- (void)cancelRequestForURL: (NSURL *)targetURL;

@end

@interface MFNetworkClient : NSObject<MFNetworkClient>

+ (id)sharedClient;

+ (void)downloadFileAtPath: (NSString *)filePath
                  callback: (MFNetworkConnectionCallback)callback;

@end
