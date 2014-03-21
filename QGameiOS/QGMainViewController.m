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

#import "QGDataService.h"
#import "RageIAPHelper.h"
#import "UIAlertView+BlockSupport.h"
#import "VZScene.h"
#import "QGProductsView.h"
#import "VZTheme.h"
#import "VZLevelCell.h"
#import "VZGameViewController.h"
#import "QGMusicManager.h"

@interface QGMainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *levelsView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation QGMainViewController

- (IBAction)_handleFeedbackEvent: (id)sender
{
    [[QGMusicManager manager] playAudio: @"back"
                              loopCount: 0];

    NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
							[@"tearsofphoenix@icloud.com" stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding],
							[@"Feedback of Vlizer" stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding],
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

- (IBAction)handlePickLevelEvent:(id)sender
{
    [[QGMusicManager manager] playAudio: @"back"
                              loopCount: 0];

    [UIView animateWithDuration: 0.5
                     animations: (^
                                  {
                                      [_scrollView setContentOffset: CGPointMake(0, 320)];
                                  })];
}

- (IBAction)handleBackToMenuEvent:(id)sender
{
    [[QGMusicManager manager] playAudio: @"back"
                              loopCount: 0];

    [UIView animateWithDuration: 0.5
                     animations: (^
                                  {
                                      [_scrollView setContentOffset: CGPointZero];
                                  })];

}

- (void)_playLevel: (NSInteger)level
{
    VZGameViewController *gameViewController = [[VZGameViewController alloc] initWithNibName: @"VZGameViewController"
                                                                                      bundle: [NSBundle mainBundle]];
    [[gameViewController view] setAlpha: 0];
    
    [self presentViewController: gameViewController
                       animated: NO
                     completion: nil];
    [UIView animateWithDuration: 0.3
                     animations: (^
                                  {
                                      [[gameViewController view] setAlpha: 1];
                                  })];
}

- (IBAction)handlePlayButton: (id)sender
{
    [[QGMusicManager manager] playAudio: @"back"
                              loopCount: 0];

    [self _playLevel: 0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [_levelsView registerClass: [VZLevelCell class]
    forCellWithReuseIdentifier: VZCellID];
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

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView: (UICollectionView *)collectionView
     numberOfItemsInSection: (NSInteger)section
{
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView: (UICollectionView *)collectionView
                  cellForItemAtIndexPath: (NSIndexPath *)indexPath
{
    VZLevelCell *cell = [_levelsView dequeueReusableCellWithReuseIdentifier: VZCellID
                                                               forIndexPath: indexPath];

    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    NSInteger idx = section * 5 + row;
    
    [[cell textLabel] setText: [NSString stringWithFormat: @"%d", idx + 1]];
    
    return cell;
}

- (void)  collectionView: (UICollectionView *)collectionView
didSelectItemAtIndexPath: (NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    NSInteger idx = section * 5 + row;

    [self _playLevel: idx];    
}

@end
