//
//  VMDataService.h
//  CrazyCat
//
//  Created by Lei on 14-7-24.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ VMNetworkCallback)(id result, NSError *error);

@interface VMDataService : NSObject

+ (instancetype)service;

- (void)POST: (NSString *)url
  parameters: (NSDictionary *)parameters
    callback: (VMNetworkCallback)callback;

@end
