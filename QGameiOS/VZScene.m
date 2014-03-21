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

#define VZBubbleCapacity (12)

@interface VZScene ()<SKPhysicsContactDelegate>
{
    CGMutablePathRef _currentPath;
}

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
        [self setBubbles: [NSMutableArray arrayWithCapacity: VZBubbleCapacity]];
        [[self physicsWorld] setGravity: CGVectorMake(0, -0.02)];
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
        SKPhysicsBody *touchBody = [SKPhysicsBody bodyWithCircleOfRadius: 1];
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
            [newBubble setPosition: CGPointMake(100, 100)];
            NSLog(@"in func: %s line: %d %@", __func__, __LINE__, newBubble);
//            [newBubble runAction: [SKAction moveByX: 30
//                                                  y: 30
//                                           duration: 0.5]];
            
            [self addChild: newBubble];
            [_bubbles addObject: newBubble];
            
            if ([newBubble number] == _currentNumber)
            {
                [newBubble showSuccessAnimation];
                [_delegate scene: self
                    didGotBubble: newBubble];
                
            }else if ([bubbleNode number] == _currentNumber)
            {
                [bubbleNode showSuccessAnimation];
                [_delegate scene: self
                    didGotBubble: bubbleNode];
            }
        }
    }
}

- (void)touchesBegan: (NSSet *)touches
           withEvent: (UIEvent *)event
{
    if (_currentPath)
    {
        CGPathRelease(_currentPath);
    }
    
    CGPoint location = [[touches anyObject] locationInNode: self];
    _currentPath = CGPathCreateMutable();
    CGPathMoveToPoint(_currentPath, NULL, location.x, location.y);
    
    [_touchNode setHidden: NO];
    [_touchNode setTargetNode: self];
    
    [_touchNode runAction: [SKAction moveTo: location
                                   duration: 0.05]];
}

- (void)touchesMoved: (NSSet *)touches
           withEvent: (UIEvent *)event
{
    CGPoint location = [[touches anyObject] locationInNode: self];
    CGPathAddLineToPoint(_currentPath, NULL, location.x, location.y);
    
    [_touchNode runAction: [SKAction moveTo: location
                                   duration: 0.05]];
}

- (void)touchesEnded: (NSSet *)touches
           withEvent: (UIEvent *)event
{
    CGPoint location = [[touches anyObject] locationInNode: self];
    CGPathAddLineToPoint(_currentPath, NULL, location.x, location.y);
    CGPathCloseSubpath(_currentPath);
    
    NSMutableArray *gatherdNodes = [NSMutableArray array];
    CGPoint targetPoint = CGPointZero;
    NSInteger sum = 0;
    
    for (VZBubbleNode *nodeLooper in _bubbles)
    {
        CGRect frame = [nodeLooper frame];
        CGPoint center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
        
        if (CGPathContainsPoint(_currentPath, NULL, center, YES))
        {
            targetPoint.x += center.x;
            targetPoint.y += center.y;
            sum += [nodeLooper number];
            
            [gatherdNodes addObject: nodeLooper];
        }
    }
    
    __block NSInteger gatheredCount = [gatherdNodes count];
    if (gatheredCount > 1)
    {
        //merge bubbles
        targetPoint.x /= gatheredCount;
        targetPoint.y /= gatheredCount;
        
        NSMutableArray *nodeCopy = [NSMutableArray arrayWithArray: gatherdNodes];
        
        SKAction *action = [SKAction moveTo: targetPoint
                                   duration: 0.5];
        
        [self runAction: [SKAction runBlock: (^
                                              {
                                                  for (VZBubbleNode *nodeLooper in gatherdNodes)
                                                  {
                                                      [nodeLooper runAction: action
                                                                 completion: (^
                                                                              {
                                                                                  [nodeCopy removeObject: nodeLooper];
                                                                                  //--gatheredCount;
                                                                                  //if (gatheredCount == 0)
                                                                                  if ([nodeCopy count] == 0)
                                                                                  {
                                                                                      //animation end
                                                                                      NSLog(@"animation end");
                                                                                      VZBubbleNode *sumNode = [gatherdNodes firstObject];
                                                                                      [sumNode setNumber: sum];
                                                                                      
                                                                                      //got one!
                                                                                      if (sum == _currentNumber)
                                                                                      {
                                                                                          [sumNode showSuccessAnimation];
                                                                                          
                                                                                          [_delegate scene: self
                                                                                              didGotBubble: sumNode];
                                                                                      }
                                                                                      
                                                                                      [gatherdNodes enumerateObjectsUsingBlock: (^(VZBubbleNode *obj, NSUInteger idx, BOOL *stop)
                                                                                                                                 {
                                                                                                                                     if (idx > 0)
                                                                                                                                     {
                                                                                                                                         [obj resetNode];
                                                                                                                                     }
                                                                                                                                 })];
                                                                                  }
                                                                              })];
                                                  }
                                              })]];
    }
    
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
    
    if ([_bubbles count] > 0)
    {
        for (VZBubbleNode *node in _bubbles)
        {
            [node setNumber: number];
            [node resetNode];
        }
    }else
    {
        for (NSInteger iLooper = 0; iLooper < VZBubbleCapacity; ++iLooper)
        {
            VZBubbleNode *node = [[VZBubbleNode alloc] initWithSceneSize: size
                                                           currentNumber: number];
            
            [_bubbles addObject: node];
            
            [self addChild: node];
        }
    }
    
    [self setPaused: NO];
}

@end
