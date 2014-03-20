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

@end

@implementation VZGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
