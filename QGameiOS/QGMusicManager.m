//
//  QGMusicManager.m
//  QGame
//
//  Created by Mac003 on 14-3-11.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGMusicManager.h"
#import <AVFoundation/AVFoundation.h>

@interface QGMusicManager ()<AVAudioPlayerDelegate>
{
    AVAudioPlayer *_audioPlayer;
}
@end

@implementation QGMusicManager

static id gsManager = nil;

+ (id)manager
{
    if (!gsManager)
    {
        gsManager = [[self alloc] init];
    }
    
    return gsManager;
}

- (void)playAudio: (NSString *)name
        loopCount: (NSInteger)numberOfLoops
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![[defaults stringForKey: QGDisableSoundEffect] boolValue])
    {
        
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: name
                                                                  ofType: @"m4a"];
        
        NSURL *fileURL = [NSURL fileURLWithPath: soundFilePath];
        
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                                                             error: nil];
        
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback
                                               error: nil];
        [[AVAudioSession sharedInstance] setActive: YES
                                             error: nil];
        
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
        
        [_audioPlayer setVolume: 0.7];
        
        [_audioPlayer setDelegate: self];
        [_audioPlayer setNumberOfLoops: -1];
        [_audioPlayer stop];
        [_audioPlayer setCurrentTime: 0];
        [_audioPlayer play];
    }
}

@end
