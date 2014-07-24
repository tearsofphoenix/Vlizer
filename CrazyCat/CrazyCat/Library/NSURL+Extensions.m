//
//  NSURL+Extensions.m
//  Carpooling
//
//  Created by Lei on 14-7-12.
//  Copyright (c) 2014年 Veritas Software. All rights reserved.
//

#import "NSURL+Extensions.h"

@implementation NSURL (Extensions)

- (NSDictionary *)queryDictionary
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSString *query = [self query];
    NSArray *components = [query componentsSeparatedByString: @"&"];
    for (NSString *str in components)
    {
        NSArray *parts = [str componentsSeparatedByString: @"="];
        if ([parts count] > 1)
        {
            dict[parts[0]] = parts[1];
        }
    }
    return dict;
}

@end
