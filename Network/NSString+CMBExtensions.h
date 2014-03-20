//
//  NSString+CMBExtensions.h
//  CMBFoundation
//
//  Created by Mac003 on 13-12-5.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CMBExtensions)

#pragma mark - value conversion

//parse string like '0xff1122', '#abcad' to integer value
//
- (NSInteger)hexIntegerValue;

#pragma mark - crypto

- (NSString *)MD5String;

- (NSString *)SHA1String;

#pragma mark - serialization

- (id)JSONObject;

- (id)plistObject;

#pragma mark - convenience

+ (id)UUIDString;

+ (id)stringWithData: (NSData *)data
                   encoding: (NSStringEncoding)encoding;

+ (id)randomStringWithLength: (NSInteger)length;

@end
