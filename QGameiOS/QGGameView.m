//
//  QGViewController.m
//  QGameiOS
//
//  Created by Mac003 on 14-3-6.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGGameView.h"
#import "VZScene.h"

#import "QGAlertView.h"
#import "QGMusicManager.h"
#import "VZTheme.h"

@interface QGGameView ()<QGSceneDelegate>
{
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UILabel *_messageLabel;
}

@end

@implementation QGGameView

- (id)initWithFrame: (CGRect)frame
{
    if (self = [super initWithFrame: frame])
    {
        
        SKView *view = self;

        UIFont *font = [UIFont fontWithName: @"HelveticaNeue-Light" //@"Baskerville-SemiBoldItalic"
                                       size: 18.5];
        
        _titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(20, 0, 280, 60)];
        [_titleLabel setBackgroundColor: [UIColor clearColor]];
        [_titleLabel setFont: font];
        [_titleLabel setTextAlignment: NSTextAlignmentCenter];
        [_titleLabel setTextColor: [VZTheme textColor]];
        [_titleLabel setNumberOfLines: 0];
        [view addSubview: _titleLabel];
        
        _contentLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, 400, 300, 60)];
        [_contentLabel setNumberOfLines: 0];
        [_contentLabel setBackgroundColor: [UIColor clearColor]];
        [_contentLabel setFont: font];
        [_contentLabel setTextAlignment: NSTextAlignmentCenter];
        [_contentLabel setTextColor: [VZTheme textColor]];
        
        [view addSubview: _contentLabel];
        
        //
        _messageLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, 300, 300, 160)];
        [_messageLabel setNumberOfLines: 0];
        [_messageLabel setBackgroundColor: [UIColor clearColor]];
        [_messageLabel setFont: [UIFont fontWithName: @"Baskerville-SemiBoldItalic"
                                                size: 18]];
        [_messageLabel setTextAlignment: NSTextAlignmentCenter];
        [_messageLabel setTextColor: [VZTheme textColor]];
        
        [view addSubview: _messageLabel];
        
        // Create and configure the scene.
        VZScene * scene = [VZScene sceneWithSize: [self bounds].size];
        
        [scene setScaleMode: SKSceneScaleModeAspectFill];
        [scene setDelegate: self];
                
        // Present the scene.
        [self presentScene: scene];
        
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
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(_notificationForTerminate)
                                                     name: UIApplicationWillTerminateNotification
                                                   object: nil];
    }
    
    return self;
}

- (void)_notificationForActive: (NSNotification *)notification
{
    [self setPaused: NO];
}

- (void)_notificationForEnactive
{
    [self setPaused: YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}


- (void)_updateTextWithInfo: (NSDictionary *)info
                      label: (UILabel *)label
{
    CGFloat y = [info[@"y"] floatValue];
    CGFloat height = [info[@"h"] floatValue];
    
    [label setText: info[@"text"]];
    CGRect frame = [label frame];
    frame.origin.y = y;
    frame.size.height = height;
    
    [label setFrame: frame];
}

- (void)didScene: (VZScene *)scene
    enteredLevel: (NSInteger)index
{
    NSDictionary *info = [scene levelInfoAtIndex: index];
    NSDictionary *textInfo = info[@"title"];
    [self _updateTextWithInfo: textInfo
                        label: _titleLabel];
    
    textInfo = info[@"content"];
    [self _updateTextWithInfo: textInfo
                        label: _contentLabel];

}

- (void)scene: (VZScene *)scene
  showMessage: (NSString *)message
{
    [_messageLabel setText: message];
}

- (void)sceneFoundWayOutInCurrentLevel: (VZScene *)scene
{
    
}

- (void)_saveCurrentGameInfo
{

}

- (void)contentViewWillDisappear
{
    [self _saveCurrentGameInfo];
}

- (void)_notificationForTerminate
{
    NSLog(@"%s %d", __func__, __LINE__);
    
    [self _saveCurrentGameInfo];
}

- (void)enterLevel: (NSInteger)index
              info: (NSDictionary *)info
{
    VZScene * scene = (VZScene *)[self scene];
    [scene enterLevel: index
                 info: info];
}

- (void)scenePlayerDieInRiver: (VZScene *)scene
{
    [[QGMusicManager manager] playAudio: @"splash"
                              loopCount: 0];
}

@end
