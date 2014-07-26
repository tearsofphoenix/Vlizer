//
//  NSDictionary+Extensions.m
//  Zanmeishi
//
//  Created by Mac003 on 14-7-3.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "NSDictionary+Extensions.h"

@implementation NSDictionary (Extensions)

- (NSString *)queryURLString
{
    NSMutableString *result = [NSMutableString string];
    
    [self enumerateKeysAndObjectsUsingBlock: (^(id key, id obj, BOOL *stop)
                                              {
                                                  if ([result length] > 0)
                                                  {
                                                      [result appendString: @"&"];
                                                  }
                                                  
                                                  [result appendFormat: @"%@=%@", key, [obj stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
                                              })];
	return result;
}

@end
