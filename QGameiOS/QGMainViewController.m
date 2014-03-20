//
//  QGMainViewController.m
//  QGame
//
//  Created by Mac003 on 14-3-13.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGMainViewController.h"
#import "QGSettingsView.h"
#import "QGGameView.h"
#import "QGProductsView.h"
#import "APPChildViewController.h"
#import "QGDataService.h"
#import "RageIAPHelper.h"
#import "UIAlertView+BlockSupport.h"
#import "QGScene.h"
#import "QGProductsView.h"

@interface QGMainViewController ()<UIPageViewControllerDataSource, APPChildViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) NSMutableArray *viewStack;

@end

@implementation QGMainViewController

- (id)initWithNibName: (NSString *)nibNameOrNil
               bundle: (NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil
                           bundle: nibBundleOrNil];
    if (self)
    {
        _viewStack = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _backButton = [[UIButton alloc] initWithFrame: CGRectMake(8, 8, 40, 40)];
    [_backButton setImage: [UIImage imageNamed: @"back"]
                 forState: UIControlStateNormal];
    [_backButton addTarget: self
                    action: @selector(_handleBackEvent:)
          forControlEvents: UIControlEventTouchUpInside];
    [_backButton setAlpha: 0];
    [[self view] addSubview: _backButton];
    
    UIFont *font = [UIFont fontWithName: @"Avenir-Medium"
                                   size: 20];
    
    UIButton *playButton = [[UIButton alloc] initWithFrame: CGRectMake(110, 200, 100, 44)];
    [playButton setTitle: @"Play"
                forState: UIControlStateNormal];
    [playButton setBackgroundColor: [UIColor clearColor]];
    [[playButton titleLabel] setFont: font];
    [[playButton titleLabel] setTextAlignment: NSTextAlignmentCenter];
    [playButton addTarget: self
                   action: @selector(_handlePlayEvent:)
         forControlEvents: UIControlEventTouchUpInside];
    [[self view] addSubview: playButton];
    
    UIButton *settingsButton = [[UIButton alloc] initWithFrame: CGRectMake(120, 260, 80, 44)];
    [settingsButton setBackgroundColor: [UIColor clearColor]];
    [[settingsButton titleLabel] setFont: font];
    [settingsButton setTitle: @"Settings"
                    forState: UIControlStateNormal];
    [[settingsButton titleLabel] setTextAlignment: NSTextAlignmentCenter];
    [settingsButton addTarget: self
                       action: @selector(_handleSettingsButtonEvent:)
             forControlEvents: UIControlEventTouchUpInside];
    [[self view] addSubview: settingsButton];
    
    UIButton *productsButton = [[UIButton alloc] initWithFrame: CGRectMake(110, 310, 100, 44)];
    [productsButton setTitle: @"Products"
                    forState: UIControlStateNormal];
    [productsButton setBackgroundColor: [UIColor clearColor]];
    [[productsButton titleLabel] setFont: font];
    [[productsButton titleLabel] setTextAlignment: NSTextAlignmentCenter];
    [productsButton addTarget: self
                       action: @selector(_handleProductsEvent:)
             forControlEvents: UIControlEventTouchUpInside];
    [[self view] addSubview: productsButton];
    
    UIButton *feedbackButton = [[UIButton alloc] initWithFrame: CGRectMake(110, 360, 100, 44)];
    [feedbackButton setBackgroundColor: [UIColor clearColor]];
    [[feedbackButton titleLabel] setFont: font];
    [[feedbackButton titleLabel] setTextAlignment: NSTextAlignmentCenter];
    [feedbackButton setTitle: @"Feedback"
                    forState: UIControlStateNormal];
    [feedbackButton addTarget: self
                       action: @selector(_handleAboutEvent:)
             forControlEvents: UIControlEventTouchUpInside];
    [[self view] addSubview: feedbackButton];
}

- (void)_showLevelViewController
{
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(8, 8, 40, 40)];
    [backButton setImage: [UIImage imageNamed: @"back"]
                 forState: UIControlStateNormal];
    [backButton addTarget: self
                    action: @selector(_handleLevelBackEvent:)
          forControlEvents: UIControlEventTouchUpInside];

    _pageController = [[UIPageViewController alloc] initWithTransitionStyle: UIPageViewControllerTransitionStyleScroll
                                                      navigationOrientation: UIPageViewControllerNavigationOrientationHorizontal
                                                                    options: nil];
    [[_pageController view] addSubview: backButton];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    APPChildViewController *initialViewController = [self viewControllerAtIndex: 0];
    
    NSArray *viewControllers = [NSArray arrayWithObject: initialViewController];
    
    [self.pageController setViewControllers: viewControllers
                                  direction: UIPageViewControllerNavigationDirectionForward
                                   animated: NO
                                 completion: nil];
    
    [self addChildViewController: self.pageController];
    [[self view] addSubview: [self.pageController view]];
}

- (void)_pushContentView: (UIView<QGContentView> *)view
{
    [[self view] addSubview: view];
    [view setAlpha: 0];
    
    [[self view] bringSubviewToFront: _backButton];
    [_viewStack addObject: view];
    
    [UIView animateWithDuration: 0.3
                     animations: (^
                                  {
                                      [view setAlpha: 1];
                                      [_backButton setAlpha: 1];
                                  })];
    
}

- (void)_handlePlayEvent: (id)sender
{
    [self _showLevelViewController];
}

- (void)_handleSettingsButtonEvent: (id)sender
{
    QGSettingsView *view = [[QGSettingsView alloc] initWithFrame: [[self view] bounds]];
    [self _pushContentView: view];
}

- (void)_handleAboutEvent: (id)sender
{
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
							[@"tearsofphoenix@icloud.com" stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding],
							[@"Feedback of QGame" stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding],
							[@""  stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]];
    
    NSURL *url = [NSURL URLWithString: mailString];
    
    if ([[UIApplication sharedApplication] canOpenURL: url])
    {
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString: mailString]];
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: nil
                                                            message: @"Your device does not support email!"
                                                           delegate: nil
                                                  cancelButtonTitle: @"OK"
                                                  otherButtonTitles: nil];
        [alertView show];
    }
}

- (void)_handleBackEvent: (id)sender
{
    UIView<QGContentView> *currentView = [_viewStack lastObject];
    if ([currentView respondsToSelector: @selector(contentViewWillDisappear)])
    {
        [currentView contentViewWillDisappear];
    }
    
    [UIView animateWithDuration: 0.3
                     animations: (^
                                  {
                                      [currentView setAlpha: 0];
                                      if ([_viewStack count] == 1)
                                      {
                                          [_backButton setAlpha: 0];
                                      }
                                  })
                     completion: (^(BOOL finished)
                                  {
                                      [currentView removeFromSuperview];
                                      [_viewStack removeLastObject];
                                  })];
}

#pragma mark --- orientation

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

#pragma mark - page control

- (APPChildViewController *)viewControllerAtIndex: (NSUInteger)index
{
    APPChildViewController *childViewController = [[APPChildViewController alloc] initWithNibName: @"APPChildViewController"
                                                                                           bundle: nil];
    childViewController.index = index;
    [childViewController setDelegate: self];
    
    return childViewController;
    
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController
      viewControllerBeforeViewController: (UIViewController *)viewController{
    
    NSUInteger index = [(APPChildViewController *)viewController index];
    
    if (index == 0)
    {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex: index];
    
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController
       viewControllerAfterViewController: (UIViewController *)viewController
{
    
    NSUInteger index = [(APPChildViewController *)viewController index];
    
    index++;
    
    return [self viewControllerAtIndex: index];
}

- (NSInteger)presentationCountForPageViewController: (UIPageViewController *)pageViewController
{
    // The number of items reflected in the page indicator.
    return [[QGDataService service] levelCount];
}

- (NSInteger)presentationIndexForPageViewController: (UIPageViewController *)pageViewController
{
    // The selected item reflected in the page indicator.
    return 0;
}

- (void)_handleLevelBackEvent: (id)sender
{
    [self _hideLevelViewController];
}

- (void)_hideLevelViewController
{
    [_pageController removeFromParentViewController];
    [[_pageController view] removeFromSuperview];
}

- (void)_handleProductsEvent: (id)sender
{
    QGProductsView *productsView = [[QGProductsView alloc] initWithFrame: [[self view] bounds]];
    [self _pushContentView: productsView];
}

- (void)childViewControllerTapped: (APPChildViewController *)viewController
{
    NSInteger index = [viewController index];
    BOOL purchased = [[RageIAPHelper sharedInstance] productPurchased: QGUnlockProductID];
    
    if (index > 0)
    {
        if (purchased)
        {
            [self _hideLevelViewController];
            [self _showGameViewAtLevel: index];
        }else
        {
            [[UIAlertView alertWithTitle: nil
                                 message: @"Unlock the reset levels?"
                       cancelButtonTitle: @"Cancel"
                       otherButtonTitles: @[ @"OK" ]
                                callback: (^(NSInteger buttonIndex)
                                           {
                                               if (buttonIndex == 1)
                                               {
                                                   NSArray *products = [[QGDataService service] products];
                                                   [[RageIAPHelper sharedInstance] buyProduct: [products firstObject]];
                                               }
                                           })] show];
        }
    }else
    {
        NSSet *set = [NSSet setWithArray: [[NSUserDefaults standardUserDefaults] objectForKey: QGPassedLevel]];
        
        if ([set containsObject: @(index)] || index == 0)
        {
            [self _hideLevelViewController];

            [self _showGameViewAtLevel: index];
        }else
        {
            [[UIAlertView alertWithTitle: nil
                                 message: @"Sorry, work harder to unlock the levels!"
                       cancelButtonTitle: @"OK"
                       otherButtonTitles: nil
                                callback: nil] show];
        }
    }
}

- (void)_showGameViewAtLevel: (NSInteger)level
{
    QGGameView *gameView = [[QGGameView alloc] initWithFrame: [[self view] bounds]];
    [gameView enterLevel: level
                    info: nil];
    
    [self _pushContentView: gameView];
}

@end
