//
//  NSObject+GRExtensions.m
//  GraceRoad
//
//  Created by Lei on 14-1-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "NSObject+GRExtensions.h"

@implementation NSObject (GRExtensions)

- (NSString *)JSONString
{
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject: self
                                                   options: 0
                                                     error: &error];
    if (error)
    {
        NSLog(@"in func: %s error: %@", __func__, error);
        return nil;
    }else
    {
        return [[[NSString alloc] initWithData: data
                                      encoding: NSUTF8StringEncoding] autorelease];
    }
}

@end
