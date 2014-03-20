//
//  QGAlertView.h
//  QGame
//
//  Created by Mac003 on 14-3-13.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ QGAlertCallback)(BOOL okTapped);
@interface QGAlertView : UIView

@property (nonatomic, copy) QGAlertCallback okCallback;

- (void)setTitle: (NSString *)title;

- (void)setMessage: (NSString *)message;

@end
