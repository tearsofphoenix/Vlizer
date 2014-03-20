//
//  NSData+CMBExtensions.h
//  CMBFoundation
//
//  Created by Mac003 on 13-12-5.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (CMBExtensions)

#pragma mark - serialization

- (id)JSONObject;

- (id)plistObject;

#pragma mark - crypto

- (NSString *)MD5String;

- (NSString *)SHA1String;

- (NSString *)hexString;

+ (id)dataWithHexString: (NSString *)hexString;

@end
