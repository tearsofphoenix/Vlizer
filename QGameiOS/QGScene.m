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
        SKSpriteNode *backgroundNode = [SKSpriteNode spriteNodeWithImageNamed: @"background"];
        [backgroundNode setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        
        [self addChild: backgroundNode];
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
