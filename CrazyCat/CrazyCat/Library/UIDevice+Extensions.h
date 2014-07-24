//
//  UIDevice+Extensions.h
//  CMBUI
//
//  Created by Mac003 on 13-12-27.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extensions)

@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSString *platform;

+ (BOOL)isiPhone5;

+ (BOOL)systemVersionGreaterThanOrEqual: (NSString *)comparedVersion;

@end
