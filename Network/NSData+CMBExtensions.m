//
//  NSData+CMBExtensions.m
//  CMBFoundation
//
//  Created by Mac003 on 13-12-5.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "NSData+CMBExtensions.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (CMBExtensions)

- (id)JSONObject
{
    NSError *error = nil;
    
    id result = [NSJSONSerialization JSONObjectWithData: self
                                                options: 0
                                                  error: &error];
    if (error)
    {
        NSLog(@"in file: %s function: %s error: %@ ", __FILE__, __FUNCTION__, [error localizedDescription]);
        return nil;
    }else
    {
        return result;
    }
}

- (id)plistObject
{
    NSError *error = nil;
    
    id result = [NSPropertyListSerialization propertyListWithData: self
                                                          options: 0
                                                           format: NULL
                                                            error: &error];
    if (error)
    {
        NSLog(@"in file: %s function: %s error: %@ ", __FILE__, __FUNCTION__, [error localizedDescription]);
        return nil;
    }else
    {
        return result;
    }
}


- (NSString *)hexString
{
    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];
    
    if (!dataBuffer)
    {
        return @"";
    }
    
    NSUInteger          dataLength  = [self length];
    NSMutableString     *hexString  = [NSMutableString stringWithCapacity: (dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i)
    {
        [hexString appendString: [NSString stringWithFormat: @"%02x", dataBuffer[i]]];
    }
    
    return [NSString stringWithString: hexString];
}

// Not efficent
+ (id)dataWithHexString: (NSString *)hex
{
	char buf[3];
	buf[2] = '\0';
	
    NSAssert(0 == [hex length] % 2, @"Hex strings should have an even number of digits (%@)", hex);
    
	unsigned char *bytes = malloc([hex length] / 2);
	unsigned char *bp = bytes;
	
    for (NSInteger i = 0; i < [hex length]; i += 2)
    {
		buf[0] = [hex characterAtIndex: i];
		buf[1] = [hex characterAtIndex: i+1];
		
        char *b2 = NULL;
		*bp++ = strtol(buf, &b2, 16);
        
		NSAssert(b2 == buf + 2, @"String should be all hex digits: %@ (bad digit around %d)", hex, i);
	}
	
	return [NSData dataWithBytesNoCopy: bytes
                                length: [hex length] / 2
                          freeWhenDone: YES];
}

- (NSString *)MD5String
{
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5([self bytes], [self length], digest);
    
    NSString *result = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        digest[0],  digest[1], digest[2],  digest[3], digest[4],  digest[5], digest[6],  digest[7],
                        digest[8],  digest[9], digest[10], digest[11], digest[12], digest[13], digest[14], digest[15]];
    
    return result;
}

- (NSString *)SHA1String
{
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([self bytes], [self length], digest);
    
    
    NSString *result = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                        digest[0],  digest[1], digest[2],  digest[3], digest[4],  digest[5], digest[6],  digest[7], digest[8],  digest[9],
                        digest[10], digest[11], digest[12], digest[13], digest[14], digest[15], digest[16], digest[17], digest[18], digest[19]];
    
    return result;
}

@end
