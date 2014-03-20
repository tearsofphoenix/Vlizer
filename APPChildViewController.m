//
//  APPChildViewController.m
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "APPChildViewController.h"

@interface APPChildViewController ()

@end

@implementation APPChildViewController

- (void)viewDidLoad
{    
    [super viewDidLoad];
    
    self.screenNumber.text = [NSString stringWithFormat: @"Level #%d", self.index];

    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self
                                                                                        action: @selector(_handleTappedEevent:)];
    [[self view] addGestureRecognizer: gestureRecognizer];
}

- (void)_handleTappedEevent: (id)sender
{
    [_delegate childViewControllerTapped: self];
}

@end
