//
//  QGMyScene.m
//  QGameiOS
//
//  Created by Mac003 on 14-3-6.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZScene.h"

#import "QGMusicManager.h"
#import "SKTexture+RectSubtexture.h"
#import "QGScene+BuildLevel.h"

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
        [_groundNode setAnchorPoint: CGPointMake(0, 0.5)];
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
            VZBubbleNode *node = [[VZBubbleNode alloc] initWithSize: size];
            
            [_bubbles addObject: node];
            
            [self addChild: node];
        }
        
        [self setTouchNode: [VZScene emmitterNode]];
        [_touchNode setTargetNode: self];
        [self addChild: _touchNode];
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
        VZBubbleNode *bubbleNode = (VZBubbleNode *)[bodyB node];
        
        [bodyB setVelocity: CGVectorMake(0, 10)];
        [bubbleNode showBreakAnimation];
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

@end
