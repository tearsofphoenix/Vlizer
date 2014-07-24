//
//  UIImage+SubimageExtraction.m
//  NoahsScratch
//
//  Created by Minun Dragonation on 9/8/12.
//  Copyright (c) 2012 Shanghai e-Intelli Software Technology Co., Ltd. All rights reserved.
//

#import "UIImage+SubimageExtraction.h"

@implementation UIImage(SubimageExtraction)

- (UIImage *)subimageInRect: (CGRect)rect
{
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL,
                                                       rect.size.width * scale,
                                                       rect.size.height * scale,
                                                       8,
                                                       rect.size.width * 4 * scale,
                                                       colorSpace,
                                                       kCGImageAlphaPremultipliedLast);
     
    CGContextDrawImage(bitmapContext, CGRectMake(-rect.origin.x * scale,
                                                 (rect.size.height - [self size].height + rect.origin.y) * scale,
                                                 [self size].width * scale,
                                                 [self size].height * scale),
                       [self CGImage]);
    
    CGImageRef cgImage = CGBitmapContextCreateImage(bitmapContext);
    
    UIImage *image = [UIImage imageWithCGImage: cgImage
                                         scale: scale
                                   orientation: UIImageOrientationUp];
    
    CGImageRelease(cgImage);
    
    CGContextRelease(bitmapContext);
    
    CGColorSpaceRelease(colorSpace);
    
    return image;
}

- (UIImage *)resizedImageWithSize: (CGSize)size
{
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL,
                                                       size.width * scale,
                                                       size.height * scale,
                                                       8,
                                                       size.width * 4 * scale,
                                                       colorSpace,
                                                       kCGImageAlphaPremultipliedLast);
    
    CGContextDrawImage(bitmapContext,
                       CGRectMake(0, 0, size.width * scale, size.height * scale),
                       [self CGImage]);
    
    CGImageRef cgImage = CGBitmapContextCreateImage(bitmapContext);
    
    UIImage *image = [UIImage imageWithCGImage: cgImage
                                         scale: scale
                                   orientation: UIImageOrientationUp];
    
    CGImageRelease(cgImage);
    
    CGContextRelease(bitmapContext);
    
    CGColorSpaceRelease(colorSpace);
    
    return image;
}

- (UIImage *)rotatedImage
{
    
    CGSize imageSize = [self size];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    CGFloat scale = [self scale];
    
    switch ([self imageOrientation])
    {
            
        case UIImageOrientationUp:
        {
            break;
        }
            
        case UIImageOrientationUpMirrored:
        {
            break;
        }
            
        case UIImageOrientationDown:
        {
            
            transform = CGAffineTransformMakeTranslation(imageSize.width * scale, imageSize.height * scale);
            transform = CGAffineTransformRotate(transform, M_PI);
            
            break;
        }
            
        case UIImageOrientationDownMirrored:
        {

            transform = CGAffineTransformMakeTranslation(imageSize.width * scale, imageSize.height * scale);
            transform = CGAffineTransformRotate(transform, M_PI);
            
            break;
        }
            
        case UIImageOrientationLeftMirrored:
        {

            transform = CGAffineTransformMakeTranslation((imageSize.height - imageSize.width) * scale, imageSize.height * scale);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);

            break;
        }
            
        case UIImageOrientationLeft:
        {
            
            transform = CGAffineTransformMakeTranslation((imageSize.height - imageSize.width) * scale, imageSize.height * scale);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            
            break;
        }
            
        case UIImageOrientationRightMirrored:
        {

            transform = CGAffineTransformMakeTranslation(imageSize.height * scale, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);

            break;
        }
            
        case UIImageOrientationRight:
        {
            
            transform = CGAffineTransformMakeTranslation(imageSize.height * scale, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            
            break;
        }
            
        default:
        {
            break;
        }
            
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL,
                                                       imageSize.width * [self scale],
                                                       imageSize.height * [self scale],
                                                       8,
                                                       4 * imageSize.width * [self scale],
                                                       colorSpace,
                                                       kCGImageAlphaPremultipliedLast);
    
    UIImageOrientation orientation = [self imageOrientation];
    
    if ((orientation == UIImageOrientationRight) ||
        (orientation == UIImageOrientationLeft) ||
        (orientation == UIImageOrientationLeftMirrored) ||
        (orientation == UIImageOrientationRightMirrored))
    {
        
        CGContextScaleCTM(bitmapContext, -1, 1);
        CGContextTranslateCTM(bitmapContext, -imageSize.height * scale, 0);
        
        transform = CGAffineTransformScale(transform, -1.0, 1.0);
        transform = CGAffineTransformTranslate(transform, -imageSize.height * scale, 0.0);
        
        CGContextConcatCTM(bitmapContext, transform);
        
        CGContextDrawImage(bitmapContext, CGRectMake(0, 0, imageSize.height * scale, imageSize.width * scale), [self CGImage]);
        
    }
    else
    {
        
        CGContextScaleCTM(bitmapContext, 1, -1);
        CGContextTranslateCTM(bitmapContext, 0, -imageSize.height * scale);
        
        transform = CGAffineTransformScale(transform, 1.0, -1.0);
        transform = CGAffineTransformTranslate(transform, 0.0, -imageSize.height * scale);
        
        CGContextConcatCTM(bitmapContext, transform);
        
        CGContextDrawImage(bitmapContext, CGRectMake(0, 0, imageSize.width * scale, imageSize.height * scale), [self CGImage]);
        
    }
    
    CGImageRef cgImage = CGBitmapContextCreateImage(bitmapContext);
    
    UIImage *newImage = [UIImage imageWithCGImage: cgImage
                                            scale: [self scale]
                                      orientation: UIImageOrientationUp];
    
    CGImageRelease(cgImage);
    
    CGContextRelease(bitmapContext);
    
    CGColorSpaceRelease(colorSpace);
    
    return newImage;
    
}


@end
