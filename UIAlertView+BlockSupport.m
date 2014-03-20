//
//  UIAlertView+BlockSupport.m
//  GraceRoad
//
//  Created by Mac003 on 14-1-3.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "UIAlertView+BlockSupport.h"
#import <objc/runtime.h>

static char UIAlertViewCallbackKey;

@interface UIAlertView ()<UIAlertViewDelegate>

@end

@implementation UIAlertView (BlockSupport)

+ (id)alertWithTitle: (NSString *)title
             message: (NSString *)message
   cancelButtonTitle: (NSString *)cancelButtonTitle
   otherButtonTitles: (NSArray *)otherButtonTitles
            callback: (GRAlertViewCallback)callback
{
    UIAlertView *alertView = [[self alloc] initWithTitle: title
                                                 message: message
                                                delegate: nil
                                       cancelButtonTitle: cancelButtonTitle
                                       otherButtonTitles: nil];
    
    [alertView setDelegate: alertView];
    
    if (callback)
    {
        [alertView setCallback: callback];
    }
    
    for (NSString *tLooper in otherButtonTitles)
    {
        [alertView addButtonWithTitle: tLooper];
    }
    
    return alertView;
}

+ (void)alertWithMessage: (NSString *)message
       cancelButtonTitle: (NSString *)cancelButtonTitle
{
    [[self alertWithTitle: nil
                  message: message
        cancelButtonTitle: cancelButtonTitle
        otherButtonTitles: nil
                 callback: nil] show];
}

- (void)setCallback: (GRAlertViewCallback)callback
{
    objc_setAssociatedObject(self, &UIAlertViewCallbackKey, callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (GRAlertViewCallback)callback
{
    return objc_getAssociatedObject(self, &UIAlertViewCallbackKey);
}

- (void)   alertView: (UIAlertView *)alertView
clickedButtonAtIndex: (NSInteger)buttonIndex
{
    GRAlertViewCallback callback = [self callback];
    
    if (callback)
    {
        callback(buttonIndex);
        [self setCallback: nil];
    }
}

@end
