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

@interface QGScene ()<SKPhysicsContactDelegate>

@property (nonatomic, strong) NSMutableArray *bubbles;

@end

@implementation QGScene

- (id)initWithSize: (CGSize)size
{
    if (self = [super initWithSize:size])
    {
        [self setBubbles: [NSMutableArray arrayWithCapacity: 10]];
        [[self physicsWorld] setGravity: CGVectorMake(0, -0.025)];
        
        SKSpriteNode *backgroundNode = [SKSpriteNode spriteNodeWithImageNamed: @"background"];
        [backgroundNode setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        
        [self addChild: backgroundNode];
        
        for (NSInteger iLooper = 0; iLooper < 10; ++iLooper)
        {
            SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed: @"bubble_back"];
            SKPhysicsBody *body = [SKPhysicsBody bodyWithCircleOfRadius: 30];
            [body setVelocity: CGVectorMake(0, 0.00000000000001)];
            [body setMass: 0.00000000000000001];
            [node setPhysicsBody: body];
            
            [node setPosition: CGPointMake(rand() % (NSInteger)size.width, size.height)];
            
            SKLabelNode *labelNode = [SKLabelNode labelNodeWithFontNamed: @"HelveticaNeue-Light"];
            NSInteger number = rand() % 7 + 1;
            [labelNode setText: [NSString stringWithFormat: @"%d", number]];
            [node addChild: labelNode];
            
            [_bubbles addObject: node];
            
            [self addChild: node];
        }
        
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
