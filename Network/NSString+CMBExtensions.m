//
//  NSString+CMBExtensions.m
//  CMBFoundation
//
//  Created by Mac003 on 13-12-5.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "NSString+CMBExtensions.h"
#import "NSData+CMBExtensions.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (CMBExtensions)

- (NSInteger)hexIntegerValue
{
    NSString *content = nil;
    
    if ([self hasPrefix: @"0x"] || [self hasPrefix: @"0X"])
    {
        content = [self substringFromIndex: 2];
        
    }else if ([self hasPrefix: @"#"])
    {
        content = [self substringFromIndex: 1];
    }
    
    if (content)
    {        
        NSInteger value = 0;
        NSInteger length = [content length];
        
        for (NSInteger iLooper = length - 1; iLooper >= 0; --iLooper)
        {
            unichar charLooper = [content characterAtIndex: iLooper];
            NSInteger vLooper = 0;
            
            if (charLooper >= 0x30 && charLooper <= 0x39)
            {
                vLooper = charLooper - 0x30;
                
            }else if(charLooper >= 0x41 && charLooper <= 0x46)
            {
                vLooper = charLooper - 0x41 + 0xA;
                
            }else if (charLooper >= 0x61 && charLooper <= 0x66)
            {
                vLooper = charLooper - 0x61 + 0xa;
            }else
            {
                NSAssert(false, @"Invalid charactor in hex string!");
            }
            
            value += vLooper << ((length - 1 - iLooper) * 4);
        }
        
        return value;
        
    }else
    {
        return [self integerValue];
    }
}


- (NSString *)MD5String
{
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self UTF8String], [self length], digest);
    
    NSString *result = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        digest[0],  digest[1], digest[2],  digest[3], digest[4],  digest[5], digest[6],  digest[7],
                        digest[8],  digest[9], digest[10], digest[11], digest[12], digest[13], digest[14], digest[15]];
    
    return result;
}

- (NSString *)SHA1String
{
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([self UTF8String], [self length], digest);
    
    
    NSString *result = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        digest[0],  digest[1], digest[2],  digest[3], digest[4],  digest[5], digest[6],  digest[7], digest[8],  digest[9],
                        digest[10], digest[11], digest[12], digest[13], digest[14], digest[15], digest[16], digest[17], digest[18], digest[19]];
    
    return result;
}

- (id)JSONObject
{
    return [[self dataUsingEncoding: NSUTF8StringEncoding] JSONObject];
}

- (id)plistObject
{
    return [[self dataUsingEncoding: NSUTF8StringEncoding] plistObject];
}


+ (id)UUIDString
{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    
    CFStringRef result = CFUUIDCreateString(NULL, uuidRef);
    
    CFRelease(uuidRef);
    
    NSString *returnValue = (__bridge NSString *)result;
    
    return [returnValue autorelease];
}

+ (id)stringWithData: (NSData *)data
            encoding: (NSStringEncoding)encoding
{
    return [[[self alloc] initWithData: data
                              encoding: encoding] autorelease];
}

static char sources[] = "qwertyuiopasdfghjklzxcvbnm1234567890";
#define SourceLength (36)

+ (id)randomStringWithLength: (NSInteger)length
{
    char *buffer = malloc(sizeof(*buffer) * (length + 1));
    
    for (NSInteger iLooper = 0; iLooper < length; ++iLooper)
    {
        buffer[iLooper] = sources[ arc4random() % 36];
    }
    
    buffer[length] = '\0';
    
    NSString *str = [[NSString alloc] initWithUTF8String: buffer];
    
    free(buffer);
    
    return [str autorelease];
}
@end
