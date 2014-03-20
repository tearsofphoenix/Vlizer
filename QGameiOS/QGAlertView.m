//
//  QGAlertView.m
//  QGame
//
//  Created by Mac003 on 14-3-13.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGAlertView.h"

@interface QGAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *okButton;

@end

@implementation QGAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor: [UIColor colorWithRed: 0.06
                                                  green: 0.11
                                                   blue: 0.07
                                                  alpha: 0.8]];
        [self setAlpha: 0.8];
        [[self layer] setBorderColor: [[UIColor whiteColor] CGColor]];
        [[self layer] setBorderWidth: 2];
        
        CGFloat width = frame.size.width;
        
        _titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, width, 40)];
        [_titleLabel setBackgroundColor: [UIColor clearColor]];
        [_titleLabel setTextAlignment: NSTextAlignmentCenter];
        [_titleLabel setTextColor: [UIColor whiteColor]];
        [_titleLabel setText: @"Notice"];
        [self addSubview: _titleLabel];
        
        _contentLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 40, width, 80)];
        [_contentLabel setBackgroundColor: [UIColor clearColor]];
        [_contentLabel setNumberOfLines: 0];
        [_contentLabel setTextAlignment: NSTextAlignmentCenter];
        [_contentLabel setTextColor: [UIColor whiteColor]];
        
        [self addSubview: _contentLabel];
        
        _cancelButton = [[UIButton alloc] initWithFrame: CGRectMake(10, 130, 100, 40)];
        
        [[_cancelButton layer] setBorderWidth: 2];
        [[_cancelButton layer] setBorderColor: [[UIColor whiteColor] CGColor]];
        [_cancelButton setTitle: @"Cancel"
                       forState: UIControlStateNormal];
        [_cancelButton addTarget: self
                          action: @selector(_handleCancelEvent:)
                forControlEvents: UIControlEventTouchUpInside];
        [self addSubview: _cancelButton];
        
        _okButton = [[UIButton alloc] initWithFrame: CGRectMake(130, 130, 90, 40)];
        
        [[_okButton layer] setBorderWidth: 2];
        [[_okButton layer] setBorderColor: [[UIColor whiteColor] CGColor]];
        [_okButton setTitle: @"OK"
                   forState: UIControlStateNormal];
        [_okButton addTarget: self
                      action: @selector(_handleOKEvent:)
            forControlEvents: UIControlEventTouchUpInside];
        [self addSubview: _okButton];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

- (void)setTitle: (NSString *)title
{
    [_titleLabel setText: title];
}

- (void)setMessage: (NSString *)message
{
    [_contentLabel setText: message];
}

- (void)_dismiss
{
    [UIView animateWithDuration: 0.3
                     animations: (^
                                  {
                                      [self setAlpha: 0];
                                  })
                     completion: (^(BOOL finished)
                                  {
                                      [self removeFromSuperview];
                                  })];
}

- (void)_handleCancelEvent: (id)sender
{
    if (_okCallback)
    {
        _okCallback(NO);
    }
    
    [self _dismiss];
}

- (void)_handleOKEvent: (id)sender
{
    if (_okCallback)
    {
        _okCallback(YES);
    }
    
    [self _dismiss];
}

@end
