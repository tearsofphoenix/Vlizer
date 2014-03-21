//
//  UIView+GradientBackground.h
//  Vlizer
//
//  Created by Mac003 on 14-3-21.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GradientBackground)

- (void)setGradientBackground: (CGFloat[])colors
                        count: (NSInteger)count;

@end
