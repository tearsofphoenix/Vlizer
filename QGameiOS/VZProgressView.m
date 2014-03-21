//
//  QGProgressView.m
//  Vlizer
//
//  Created by Mac003 on 14-3-21.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZProgressView.h"
#import "UIView+GradientBackground.h"

#import <QuartzCore/QuartzCore.h>

@interface VZProgressView ()

@property (nonatomic, strong) UIView *indicatorView;

@end

@implementation VZProgressView

- (void)_commonInit
{
    [[self layer] setCornerRadius: 10];
    CGFloat colorList[]     = {0.35, 0.56, 0.15, 1.0,
                               0.5, 0.75, 0.18, 0.5};
    [self setGradientBackground: colorList
                          count: 2];
    
    CGRect bounds = [self bounds];
    CGRect frame = bounds;
    frame.size.width = 20;
    frame.origin.x = (bounds.size.width - frame.size.width) / 2;
    
    _indicatorView = [[UIView alloc] initWithFrame: frame];
    [[_indicatorView layer] setCornerRadius: frame.size.height / 2];
    [_indicatorView setBackgroundColor: [UIColor redColor]];
    
    [self addSubview: _indicatorView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self)
    {
        [self _commonInit];
    }
    return self;
}

- (id)initWithCoder: (NSCoder *)aDecoder
{
    if ((self = [super initWithCoder: aDecoder]))
    {
        [self _commonInit];
    }
    
    return self;
}

@end
