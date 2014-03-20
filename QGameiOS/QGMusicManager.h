//
//  QGMusicManager.h
//  QGame
//
//  Created by Mac003 on 14-3-11.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QGScene.h"

#define QGDisableSoundEffect QGPrefix "disable-sound-effect"

@interface QGMusicManager : NSObject

+ (id)manager;

- (void)playAudio: (NSString *)name
        loopCount: (NSInteger)numberOfLoops;

@end
