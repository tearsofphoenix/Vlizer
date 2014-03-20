//
//  VZGameViewController.m
//  Vlizer
//
//  Created by Mac003 on 14-3-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZGameViewController.h"
#import <SpriteKit/SpriteKit.h>

@interface VZGameViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet SKView *skview;

@property (weak, nonatomic) IBOutlet UIView *tutorView;

@end

@implementation VZGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)_showNumberView
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_tutorView setTransform: CGAffineTransformMakeTranslation(0, -768)];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *record = [defaults stringForKey: VZHasShowTutor];
    if ([record boolValue])
    {
        [self _showNumberView];
    }else
    {
        [UIView animateWithDuration: 0.5
                         animations: (^
                                      {
                                          [_tutorView setTransform: CGAffineTransformIdentity];
                                          [_tutorView setAlpha: 0.8];
                                      })
                         completion: (^(BOOL finished)
                                      {
                                          [UIView animateWithDuration: 0.5
                                                                delay: 3.0
                                                              options: 0
                                                           animations: (^
                                                                        {
                                                                            [_tutorView setAlpha: 0];
                                                                        })
                                                           completion: (^(BOOL finished)
                                                                        {
                                                                            [defaults setObject: @"YES"
                                                                                         forKey: VZHasShowTutor];
                                                                            [defaults synchronize];
                                                                            
                                                                            [self _showNumberView];
                                                                        })];
                                      })];
    }
}

- (IBAction)handleBackEvent:(id)sender
{
    [UIView animateWithDuration: 0.5
                     animations: (^
                                  {
                                      [[self view] setAlpha: 0];
                                  })];
    
    [[self presentingViewController] dismissViewControllerAnimated: NO
                                                        completion: nil];
}

@end
