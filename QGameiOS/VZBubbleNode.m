//
//  VZBubbleNode.m
//  Vlizer
//
//  Created by Lei on 14-3-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZBubbleNode.h"

@interface VZBubbleNode ()

@property (nonatomic, strong) SKLabelNode *labelNode;
@property (nonatomic) NSInteger currentNumber;

@end

@implementation VZBubbleNode

static SKAction *gsBreakAction = nil;
static SKAction *gsLabelAction = nil;

+ (void)initialize
{
    SKAction *fadeAction = [SKAction fadeAlphaTo: 0
                                        duration: 0.7];
    SKAction *scaleAction = [SKAction scaleTo: 1.5
                                     duration: 0.7];
    
    gsBreakAction = [SKAction group: @[fadeAction, scaleAction]];
    
    
}

- (id)initWithSceneSize: (CGSize)size
          currentNumber: (NSInteger)currentNumber
{
    if ((self = [super initWithImageNamed: @"bubble_back"]))
    {
        [self setCurrentNumber: currentNumber];
        
        int randNumber = rand();
        NSInteger speed = randNumber % _currentNumber + 10;
        
        [self setSize: CGSizeMake(30, 30)];
        SKPhysicsBody *body = [SKPhysicsBody bodyWithCircleOfRadius: 15];
        [body setAffectedByGravity: YES];
        [body setUsesPreciseCollisionDetection: YES];
        [body setVelocity: CGVectorMake(0, -speed)];
        [body setMass: 0.1];
        [body setCategoryBitMask: VZBubbleMask];
        [body setContactTestBitMask: VZGroundMask | VZTouchMask];
        [body setCollisionBitMask: VZGroundMask];
        
        [self setPhysicsBody: body];
        
        [self setPosition: CGPointMake(15 + randNumber % (NSInteger)(size.width - 15 * 2),
                                       size.height + 50 + 10 * (randNumber % 10))];
        
        SKLabelNode *labelNode = [SKLabelNode labelNodeWithFontNamed: @"HelveticaNeue-Light"];
        [self setLabelNode: labelNode];
        [labelNode setVerticalAlignmentMode: SKLabelVerticalAlignmentModeCenter];
        [labelNode setHorizontalAlignmentMode: SKLabelHorizontalAlignmentModeCenter];
        
        NSInteger number = randNumber % _currentNumber + 1;
        [self setNumber: number];
        [self addChild: labelNode];
    }
    
    return self;
}

- (void)showBreakAnimation
{
    NSInteger randNumber = rand();
    
    [self runAction: [SKAction customActionWithDuration: 0.6
                                            actionBlock: (^(SKNode *node, CGFloat elapsedTime)
                                                          {
                                                              VZBubbleNode *bubbleNode = (VZBubbleNode *)node;
                                                              [bubbleNode setScale: 1.5];
                                                              
                                                              SKLabelNode *labelNode = [bubbleNode labelNode];
                                                              [labelNode setFontColor: [SKColor redColor]];
                                                              [labelNode setColor: [SKColor redColor]];
                                                              [labelNode setText: [NSString stringWithFormat: @"-%ld", (long)_number]];
                                                              [labelNode setScale: 1.5];
                                                          })]
         completion: (^
                      {
                          NSInteger speed = randNumber % _currentNumber + 10;
                          [[self physicsBody] setVelocity: CGVectorMake(0, -speed)];
                          
                          CGSize size = [[self scene] size];
                          
                          [self setPosition: CGPointMake(15 + randNumber % (NSInteger)(size.width - 15 * 2),
                                                         size.height + 50 + 10 *(randNumber % 10))];
                          [self setAlpha: 1];
                          [self setScale: 1.0];
                          
                          _number = randNumber % _currentNumber + 1;
                          [_labelNode setText: [NSString stringWithFormat: @"%ld", (long)_number]];
                          [_labelNode setFontColor: [SKColor whiteColor]];
                          [_labelNode setScale: 1];
                          [_labelNode setAlpha: 1];
                      })];
    
}

- (void)setNumber: (NSInteger)number
{
    if (_number != number)
    {
        _number = number;
        [_labelNode setText: [NSString stringWithFormat: @"%ld", (long)number]];
    }
}

- (BOOL)canBeSplit
{
    return _number > 1;
}

- (VZBubbleNode *)split
{
    if ([self canBeSplit])
    {
        CGSize size = [[self scene] size];
        CGPoint position = [self position];
        position.x += 40;
        
        NSLog(@"%@", NSStringFromCGPoint(position));
        
        NSInteger numberA = rand() % (_number - 1) + 1;
        VZBubbleNode *nodeA = [[VZBubbleNode alloc] initWithSceneSize: size
                                                        currentNumber: _currentNumber];
        [nodeA setNumber: numberA];
        [nodeA setPosition: position];

        [self setNumber: (_number - numberA)];
        
        return nodeA;
    }
    
    return nil;
}


#if 0
- (void)trace
{
    /*
     Here I want to create a texture node, that contains all of the sprites of the _traceNode layer.
     Problem: the texture has the size of the rect that contains all of the nodes.
     Solution: add a point in the top right and in the bottom left corner so the texture size will be equivalent to the _traceNode size
     Then the latest object to the trace gets added
     
     As (I guess) this is an expensive operation I only do it if more than 100 nodes are on the screen
     
     I create the texture and store it, then delete all children and add the texture again. (Not really sure why I have to scale it whit 0.5)
     */
    
    
    // create to points that define the size of the texture
    SKSpriteNode *bottomLeft = [SKSpriteNode spriteNodeWithColor:nil size:CGSizeZero];
    bottomLeft.position = CGPointZero;
    SKSpriteNode *topRight = [SKSpriteNode spriteNodeWithColor:nil size:CGSizeZero];
    topRight.position = CGPointMake(self.size.width, self.size.height);
    
    // add the points to the layer
    [_traceNode addChild: bottomLeft];
    [_traceNode addChild: topRight];
    
    // add the latest circle to draw the trace at the brushes position
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture: _brush1.brushTexture];
    sprite.position = _brush1.brush.position;
    [_traceNode addChild:sprite];
    
    // keep an approximate nodecount so that it can be resettet if there are too many
    _nodeCount += 3;  //TODO adjust for more players
    
    if (_nodeCount > 50)
    {
        // flatten all childnodes to the texture
        SKTexture *texture = [self.view textureFromNode:_traceNode];
        
        // remove all children
        [_traceNode removeAllChildren];
        
        // add the texture
        SKSpriteNode *newTraceNode = [SKSpriteNode spriteNodeWithTexture:texture];
        newTraceNode.anchorPoint = CGPointMake(0, 0);
        newTraceNode.xScale = 0.5;
        newTraceNode.yScale = 0.5;
        [_traceNode addChild: newTraceNode];
        
        // reset the nodecount
        _nodeCount = 0;
        
    }
}

#endif

@end
