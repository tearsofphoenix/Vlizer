//
//  APPChildViewController.h
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APPChildViewController;
@protocol APPChildViewControllerDelegate <NSObject>

- (void)childViewControllerTapped: (APPChildViewController *)viewController;

@end

@interface APPChildViewController : UIViewController

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UILabel *screenNumber;

@property (nonatomic, weak) id<APPChildViewControllerDelegate> delegate;

@end
