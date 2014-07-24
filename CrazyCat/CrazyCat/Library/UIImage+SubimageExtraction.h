//
//  UIImage+SubimageExtraction.h
//  NoahsScratch
//
//  Created by Minun Dragonation on 9/8/12.
//  Copyright (c) 2012 Shanghai e-Intelli Software Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SubimageExtraction)

- (UIImage *)subimageInRect: (CGRect)rect;

- (UIImage *)resizedImageWithSize: (CGSize)size;

- (UIImage *)rotatedImage;

@end
