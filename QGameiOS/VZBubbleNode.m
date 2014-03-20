//
//  VZBubbleNode.m
//  Vlizer
//
//  Created by Lei on 14-3-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZBubbleNode.h"

@interface VZBubbleNode ()

@property (nonatomic) NSInteger number;
@property (nonatomic, strong) SKLabelNode *labelNode;

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

- (id)initWithSize: (CGSize)size
{
    if ((self = [super initWithImageNamed: @"bubble_back"]))
    {
        int randNumber = rand();
        NSInteger speed = randNumber % 7 + 10;
        
        [self setSize: CGSizeMake(30, 30)];
        SKPhysicsBody *body = [SKPhysicsBody bodyWithCircleOfRadius: 15];
        [body setAffectedByGravity: YES];
        [body setUsesPreciseCollisionDetection: YES];
        [body setVelocity: CGVectorMake(0, -speed)];
        [body setMass: 0.1];
        [body setCategoryBitMask: VZBubbleMask];
        [body setContactTestBitMask: VZGroundMask];
        [body setCollisionBitMask: VZGroundMask];
        
        [self setPhysicsBody: body];
        
        [self setPosition: CGPointMake(randNumber % (NSInteger)size.width, size.height)];
        
        SKLabelNode *labelNode = [SKLabelNode labelNodeWithFontNamed: @"HelveticaNeue-Light"];
        [self setLabelNode: labelNode];
        [labelNode setVerticalAlignmentMode: SKLabelVerticalAlignmentModeCenter];
        [labelNode setHorizontalAlignmentMode: SKLabelHorizontalAlignmentModeCenter];
        
        NSInteger number = rand() % 7 + 1;
        [self setNumber: number];
        [self addChild: labelNode];
    }
    
    return self;
}

- (void)showBreakAnimation
{
    NSInteger randNumber = rand();
    
    [_labelNode runAction: [SKAction customActionWithDuration: 0.6
                                                  actionBlock: (^(SKNode *node, CGFloat elapsedTime)
                                                                {
                                                                    SKLabelNode *labelNode = (SKLabelNode *)node;
                                                                    [labelNode setFontColor: [SKColor redColor]];
                                                                    [labelNode setColor: [SKColor redColor]];
                                                                    [labelNode setText: [NSString stringWithFormat: @"-%d", _number]];
                                                                    [labelNode setScale: 1.5];
                                                                    //                                                                    [labelNode setAlpha: 0];
                                                                })]
               completion: (^
                            {
                                _number = randNumber % 7 + 1;
                                [_labelNode setText: [NSString stringWithFormat: @"%d", _number]];
                                [_labelNode setFontColor: [SKColor whiteColor]];
                                [_labelNode setScale: 1];
                                [_labelNode setAlpha: 1];
                            })];
    
    [self runAction: gsBreakAction
         completion: (^
                      {
                          NSInteger speed = randNumber % 7 + 10;
                          [[self physicsBody] setVelocity: CGVectorMake(0, -speed)];
                          
                          CGSize size = [[self scene] size];
                          
                          [self setPosition: CGPointMake(randNumber % (NSInteger)size.width, size.height + 60)];
                          [self setAlpha: 1];
                          [self setScale: 1.0];
                      })];
    
}

- (void)setNumber: (NSInteger)number
{
    if (_number != number)
    {
        _number = number;
        [_labelNode setText: [NSString stringWithFormat: @"%d", number]];
    }
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
