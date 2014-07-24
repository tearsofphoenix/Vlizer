//
//  UIDevice+Extensions.m
//  CMBUI
//
//  Created by Mac003 on 13-12-27.
//  Copyright (c) 2013年 Mac003. All rights reserved.
//

#import "UIDevice+Extensions.h"
#import <sys/sysctl.h>

@implementation UIDevice (Extensions)

- (NSString *)platform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    
    NSString *platform = @(machine);
    platform= [platform lowercaseString];
    
    free(machine);
    
    return platform;
}

+ (BOOL)isiPhone5
{
    return CGSizeEqualToSize(CGSizeMake(640, 1136), [[[UIScreen mainScreen] currentMode] size]);
}

+ (BOOL)systemVersionGreaterThanOrEqual: (NSString *)v
{
    return [[[self currentDevice] systemVersion] compare: v
                                                 options: NSNumericSearch] != NSOrderedAscending;
}

@end
