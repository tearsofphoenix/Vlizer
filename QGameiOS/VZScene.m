//
//  QGMyScene.m
//  QGameiOS
//
//  Created by Mac003 on 14-3-6.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZScene.h"

#import "QGMusicManager.h"

#import "QGDataService.h"
#import "VZBubbleNode.h"

@interface VZScene ()<SKPhysicsContactDelegate>

@property (nonatomic, strong) NSMutableArray *bubbles;
@property (nonatomic, strong) SKSpriteNode *groundNode;
@property (nonatomic, strong) SKEmitterNode *touchNode;

@end

@implementation VZScene

+ (SKEmitterNode *)emmitterNode
{
    NSString *path = [[NSBundle mainBundle] pathForResource: @"trace"
                                                     ofType: @"sks"];
    return [NSKeyedUnarchiver unarchiveObjectWithFile: path];
}

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
        [_groundNode setAnchorPoint: CGPointMake(0, 0.8)];
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
        
        [self setTouchNode: [VZScene emmitterNode]];
        [_touchNode setTargetNode: self];
        SKPhysicsBody *touchBody = [SKPhysicsBody bodyWithCircleOfRadius: 10];
        [touchBody setAffectedByGravity: NO];
        [touchBody setCategoryBitMask: VZTouchMask];
        [touchBody setContactTestBitMask: VZBubbleMask];
        [touchBody setCollisionBitMask: VZBubbleMask];
        [_touchNode setPhysicsBody: touchBody];
        
        [self addChild: _touchNode];
    }
    
    return self;
}

- (void)update: (CFTimeInterval)currentTime
{
    
}

- (void)didBeginContact: (SKPhysicsContact *)contact
{
    SKPhysicsBody *bodyA = [contact bodyA];
    SKPhysicsBody *bodyB = [contact bodyB];
    if ([bodyA categoryBitMask] > [bodyB categoryBitMask])
    {
        bodyA = [contact bodyB];
        bodyB = [contact bodyA];
    }
    
    //NSLog(@"%@ %@", [bodyA node], [bodyB node]);
    
    if (([bodyA categoryBitMask] & VZGroundMask) != 0
        && ([bodyB categoryBitMask] & VZBubbleMask) != 0)
    {
        VZBubbleNode *bubbleNode = (VZBubbleNode *)[bodyB node];
        
        [bodyB setVelocity: CGVectorMake(0, 10)];
        [bubbleNode showBreakAnimation];
        
        [_delegate scene: self
          didBreakBubble: bubbleNode];
        
    }else if (([bodyA categoryBitMask] & VZBubbleMask) != 0
              && ([bodyB categoryBitMask] & VZTouchMask) != 0)
    {
        //try to split
        VZBubbleNode *bubbleNode = (VZBubbleNode *)[bodyA node];
        VZBubbleNode *newBubble = [bubbleNode split];
        if (newBubble)
        {
            //            [self addChild: newBubble];
            //            [newBubble setPosition: CGPointMake(320, 300)];
            //            [newBubble runAction: [SKAction moveByX: 30
            //                                                  y: 30
            //                                           duration: 0.5]];
            [_bubbles addObject: newBubble];
        }
    }
}

- (void)touchesBegan: (NSSet *)touches
           withEvent: (UIEvent *)event
{
    [_touchNode setHidden: NO];
    [_touchNode setTargetNode: self];
    
    [_touchNode runAction: [SKAction moveTo: [[touches anyObject] locationInNode: self]
                                   duration: 0.05]];
}

- (void)touchesMoved: (NSSet *)touches
           withEvent: (UIEvent *)event
{
    [_touchNode runAction: [SKAction moveTo: [[touches anyObject] locationInNode: self]
                                   duration: 0.05]];
}

- (void)touchesEnded: (NSSet *)touches
           withEvent: (UIEvent *)event
{
    [_touchNode runAction: [SKAction customActionWithDuration: 0.2
                                                  actionBlock: (^(SKNode *node, CGFloat elapsedTime)
                                                                {
                                                                    [_touchNode setHidden: YES];
                                                                })]
               completion: (^
                            {
                                [_touchNode setTargetNode: nil];
                            })];
}

- (void)startGameWithNumber: (NSInteger)number
{
    [self setCurrentNumber: number];
    
    CGSize size = [self size];
    
    for (NSInteger iLooper = 0; iLooper < 10; ++iLooper)
    {
        VZBubbleNode *node = [[VZBubbleNode alloc] initWithSceneSize: size
                                                       currentNumber: number];
        
        [_bubbles addObject: node];
        
        [self addChild: node];
    }
}

- (void)restartGame
{
    CGSize size = [self size];
    
    for (VZBubbleNode *node in _bubbles)
    {
        NSInteger randNumber = random();
        [node setPosition: CGPointMake(15 + randNumber % (NSInteger)(size.width - 15 * 2),
                                       size.height + 50 + 10 * (randNumber % 10))];
        
    }
    
    [self setPaused: NO];
}

@end
