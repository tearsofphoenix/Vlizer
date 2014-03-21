//
//  UIView+GradientBackground.m
//  Vlizer
//
//  Created by Mac003 on 14-3-21.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "UIView+GradientBackground.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation UIView (GradientBackground)

- (void)setGradientBackground: (CGFloat[])colorList
                    locations: (CGFloat[])locationList
                        count: (NSInteger)count
{
    @autoreleasepool
    {
        // Allocate color space
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        // Allocate bitmap context
        CGContextRef bitmapContext = CGBitmapContextCreate(NULL, 320, 480, 8, 4 * 320, colorSpace, kCGImageAlphaNoneSkipFirst);
        //allocate myGradient
//        CGFloat locationList[]  = {0.0f, 1.0f};
//        CGFloat colorList[]     = {0.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f};
        CGGradientRef myGradient   = CGGradientCreateWithColorComponents(colorSpace, colorList, locationList, count);
        // Draw Gradient Here
        CGContextDrawLinearGradient(bitmapContext, myGradient, CGPointMake(0.0f, 0.0f), CGPointMake(320.0f, 480.0f), 0);
        // Create a CGImage from context
        CGImageRef cgImage = CGBitmapContextCreateImage(bitmapContext);
        // Create a UIImage from CGImage
        UIImage *uiImage = [UIImage imageWithCGImage:cgImage];
        // Release the CGImage
        CGImageRelease(cgImage);
        // Release the bitmap context
        CGContextRelease(bitmapContext);
        // Release the color space
        CGColorSpaceRelease(colorSpace);
        // Create the patterned UIColor and set as background color
        [self setBackgroundColor: [UIColor colorWithPatternImage: uiImage]];
    }
}

@end
