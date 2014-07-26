//
//  VMDataService.m
//  CrazyCat
//
//  Created by Lei on 14-7-24.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VMDataService.h"
#import "AFNetworking.h"

@implementation VMDataService

+ (instancetype)service
{
    static id gsService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   gsService = [[self alloc] init];
                               }));
    
    return gsService;
}

- (void)POST: (NSString *)url
  parameters: (NSDictionary *)parameters
    callback: (VMNetworkCallback)callback
{

}

@end
