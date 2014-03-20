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

enum
{
    VZGroundMask = 0x1 < 1,
    VZBubbleMask = 0x1 < 2,
};

typedef uint32_t VZConcatMask;

@interface QGScene ()<SKPhysicsContactDelegate>

@property (nonatomic, strong) NSMutableArray *bubbles;
@property (nonatomic, strong) SKSpriteNode *groundNode;

@end

@implementation QGScene

- (id)initWithSize: (CGSize)size
{
    if (self = [super initWithSize:size])
    {
        [self setBubbles: [NSMutableArray arrayWithCapacity: 10]];
        [[self physicsWorld] setGravity: CGVectorMake(0, -0.025)];
        [[self physicsWorld] setContactDelegate: self];
        
        SKSpriteNode *backgroundNode = [SKSpriteNode spriteNodeWithImageNamed: @"background"];
        [backgroundNode setPosition: CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        [self addChild: backgroundNode];

        [self setGroundNode: [SKSpriteNode spriteNodeWithImageNamed: @"floor"]];
        [_groundNode setAnchorPoint: CGPointZero];
        [self addChild: _groundNode];
        
        CGRect groundFrame = [_groundNode frame];
        groundFrame.origin.x = 0;
        SKPhysicsBody *groundBody = [SKPhysicsBody bodyWithEdgeLoopFromRect: groundFrame];
        [groundBody setDynamic: NO];
        [groundBody setCategoryBitMask: VZGroundMask];
        [groundBody setUsesPreciseCollisionDetection: YES];
        
        [groundBody setContactTestBitMask: VZBubbleMask];
        [groundBody setCollisionBitMask: VZBubbleMask];
        
        [_groundNode setPhysicsBody: groundBody];
        
        for (NSInteger iLooper = 0; iLooper < 10; ++iLooper)
        {
            NSInteger speed = rand() % 7 + 10;
            
            SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed: @"bubble_back"];
            [node setSize: CGSizeMake(30, 30)];
            SKPhysicsBody *body = [SKPhysicsBody bodyWithCircleOfRadius: 15];
            [body setAffectedByGravity: YES];
            [body setUsesPreciseCollisionDetection: YES];
            [body setVelocity: CGVectorMake(0, -speed)];
            [body setMass: 0.1];
            [body setCategoryBitMask: VZBubbleMask];
            [body setContactTestBitMask: VZGroundMask];
            [body setCollisionBitMask: VZGroundMask];
            
            [node setPhysicsBody: body];
            
            [node setPosition: CGPointMake(rand() % (NSInteger)size.width, size.height)];
            
            SKLabelNode *labelNode = [SKLabelNode labelNodeWithFontNamed: @"HelveticaNeue-Light"];
            [labelNode setVerticalAlignmentMode: SKLabelVerticalAlignmentModeCenter];
            [labelNode setHorizontalAlignmentMode: SKLabelHorizontalAlignmentModeCenter];
            
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

- (void)didBeginContact: (SKPhysicsContact *)contact
{
    SKPhysicsBody *bodyA = [contact bodyA];
    SKPhysicsBody *bodyB = [contact bodyB];
    if ([bodyA categoryBitMask] == VZGroundMask && [bodyB categoryBitMask] == VZBubbleMask)
    {
        NSLog(@"%@ %@", [bodyA node], [bodyB node]);
    }
}

@end
