//
//  VZGameViewController.m
//  Vlizer
//
//  Created by Mac003 on 14-3-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZGameViewController.h"
#import "VZScene.h"
#import "VZProgressView.h"
#import "VZBubbleNode.h"

@interface VZGameViewController ()<QGSceneDelegate>

@property (weak, nonatomic) IBOutlet VZProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet SKView *skview;

@property (weak, nonatomic) IBOutlet UIView *tutorView;

@property (weak, nonatomic) IBOutlet UILabel *preNumberLabel;
@property (weak, nonatomic) IBOutlet UIView *numberView;

@property (nonatomic, strong) VZScene *scene;

@property (weak, nonatomic) IBOutlet UIView *gameLostView;
@end

@implementation VZGameViewController

- (id)initWithNibName: (NSString *)nibNameOrNil
               bundle: (NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(_notificationForActive:)
                                                     name: UIApplicationWillEnterForegroundNotification
                                                   object: nil];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(_notificationForActive:)
                                                     name: UIApplicationDidBecomeActiveNotification
                                                   object: nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(_notificationForEnactive)
                                                     name: UIApplicationDidEnterBackgroundNotification
                                                   object: nil];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(_notificationForEnactive)
                                                     name: UIApplicationWillResignActiveNotification
                                                   object: nil];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(_notificationForEnactive)
                                                     name: UIApplicationWillTerminateNotification
                                                   object: nil];
//        [[NSNotificationCenter defaultCenter] addObserver: self
//                                                 selector: @selector(_notificationForTerminate)
//                                                     name: UIApplicationWillTerminateNotification
//                                                   object: nil];
    }
    return self;
}

- (void)_notificationForActive: (NSNotification *)notification
{
    [_scene setPaused: NO];
}

- (void)_notificationForEnactive
{
    [_scene setPaused: YES];
}

- (void)dealloc
{
    NSLog(@"in func: %s line: %d", __func__, __LINE__);
    
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}


- (void)_showNumberViewWith: (NSInteger)number
{
    [_preNumberLabel setText: [NSString stringWithFormat: @"%ld", (long)number]];
    [UIView animateWithDuration: 0.5
                     animations: (^
                                  {
                                      [_numberView setAlpha: 1];
                                  })
                     completion: (^(BOOL finished)
                                  {
                                      [UIView animateWithDuration: 0.5
                                                            delay: 2.0
                                                          options: 0
                                                       animations: (^
                                                                    {
                                                                        [_numberView setAlpha: 0];
                                                                    })
                                                       completion: (^(BOOL finished)
                                                                    {
                                                                        //start game
                                                                        [self _startGameWithNumber: number];
                                                                    })];
                                  })];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_tutorView setTransform: CGAffineTransformMakeTranslation(0, -768)];
    [[_gameLostView layer] setCornerRadius: 10];
    
    [_progressView setMaxNumber: 140];
    [_progressView setCurrentIndex: 70];
    
//    [_skview setShowsDrawCount: YES];
//    [_skview setShowsFPS: YES];
//    [_skview setShowsPhysics: YES];
//    [_skview setShowsNodeCount: YES];
    
#if 0
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
#endif
    
    VZScene *scene = [[VZScene alloc] initWithSize: [_skview bounds].size];
    [scene setDelegate: self];
    [self setScene: scene];
    
    [_skview presentScene: scene];
    [self _startGameWithNumber: 7];
}

- (void)_startGameWithNumber: (NSInteger)number
{
    [_numberLabel setText: [NSString stringWithFormat: @"NUMBER: %ld", (long)number]];
    [_scene startGameWithNumber: number];
    
}

- (void) scene: (VZScene *)scene
didBreakBubble: (VZBubbleNode *)bubble
{
    NSInteger currentIndex = [_progressView currentIndex];
    currentIndex -= [bubble number];
    
    if (currentIndex <= 0)
    {
        //end game
        [_scene setPaused: YES];
        [UIView animateWithDuration: 0.5
                         animations: (^
                                      {
                                          [_gameLostView setFrame: CGRectMake(20, 142, 280, 255)];
                                      })];
        //
    }else
    {
        [_progressView setCurrentIndex: currentIndex];
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


- (IBAction)handleTryAgainEvent: (id)sender
{
    [_progressView setCurrentIndex: [_progressView maxNumber] / 2];
    [_scene restartGame];
    
    CGRect frame = [_gameLostView frame];
    frame.origin.y = -frame.size.height;
    
    [UIView animateWithDuration: 0.5
                     animations: (^
                                  {
                                      [_gameLostView setFrame: frame];
                                  })];
}

#pragma mark - orientation

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else
    {
        return UIInterfaceOrientationMaskAll;
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
