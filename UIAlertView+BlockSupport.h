//
//  UIAlertView+BlockSupport.h
//  GraceRoad
//
//  Created by Mac003 on 14-1-3.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ GRAlertViewCallback)(NSInteger buttonIndex);

@interface UIAlertView (BlockSupport)

+ (id)alertWithTitle: (NSString *)title
             message: (NSString *)message
   cancelButtonTitle: (NSString *)cancelButtonTitle
   otherButtonTitles: (NSArray *)otherButtonTitles
            callback: (GRAlertViewCallback)callback;

+ (void)alertWithMessage: (NSString *)message
       cancelButtonTitle: (NSString *)cancelButtonTitle;

@property (nonatomic, copy) GRAlertViewCallback callback;

@end
