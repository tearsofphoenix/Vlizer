//
//  QGMyScene.m
//  QGameiOS
//
//  Created by Mac003 on 14-3-6.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGScene.h"

#import "QGMusicManager.h"
#import "SKTexture+RectSubtexture.h"
#import "QGScene+BuildLevel.h"

#import "QGDataService.h"

@implementation QGScene

- (id)initWithSize: (CGSize)size
{
    if (self = [super initWithSize:size])
    {
        //[self setBackgroundColor: [SKColor colorWithRed:0.27 green:0.27 blue:0.27 alpha:1]];
        [self setBackgroundColor: [UIColor blackColor]];

    }
    
    return self;
}

- (void)update: (CFTimeInterval)currentTime
{
    
}

- (void)enterLevel: (NSInteger)index
              info: (NSDictionary *)info
{
    
}

- (NSDictionary *)levelInfoAtIndex: (NSInteger)index
{
    return [[QGDataService service] levelWithIndex: index];
}

@end
