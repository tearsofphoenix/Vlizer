//
//  VZLevelCell.m
//  Vlizer
//
//  Created by Mac003 on 14-3-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZLevelCell.h"

@interface VZLevelCell ()

@end

@implementation VZLevelCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat margin = 4;
        CGRect bounds = [self bounds];
        bounds.origin.x = margin;
        bounds.origin.y = margin;
        bounds.size.width -= 2 * margin;
        bounds.size.height -= 2 * margin;
        
        _textLabel = [[UILabel alloc] initWithFrame: bounds];
        [_textLabel setTextAlignment: NSTextAlignmentCenter];
        [_textLabel setBackgroundColor: [UIColor darkGrayColor]];
        [_textLabel setTextColor: [UIColor whiteColor]];
        
        [self addSubview: _textLabel];
    }
    return self;
}


@end
