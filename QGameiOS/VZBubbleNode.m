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


@end
