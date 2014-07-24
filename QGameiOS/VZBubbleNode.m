//
//  VZBubbleNode.m
//  Vlizer
//
//  Created by Lei on 14-3-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZBubbleNode.h"
#import "QGMusicManager.h"

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
        //[body setUsesPreciseCollisionDetection: YES];
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
        
        NSInteger number = 0;

        if (randNumber % 3 == 0 )
        {
            number = randNumber % (_currentNumber - 1) + 1 + _currentNumber;
        }else
        {
            number = randNumber % (_currentNumber - 1) + 1;
        }
        
        [self setNumber: number];
        [self addChild: labelNode];
    }
    
    return self;
}

- (void)showSuccessAnimation
{
    [self runAction: [SKAction customActionWithDuration: 0.6
                                            actionBlock: (^(SKNode *node, CGFloat elapsedTime)
                                                          {
                                                              VZBubbleNode *bubbleNode = (VZBubbleNode *)node;
                                                              [bubbleNode setScale: 1.5];
                                                              
                                                              SKLabelNode *labelNode = [bubbleNode labelNode];
                                                              [labelNode setFontColor: [SKColor greenColor]];
                                                              [labelNode setColor: [SKColor greenColor]];
                                                              [labelNode setText: [NSString stringWithFormat: @"+%ld", (long)_number]];
                                                              [labelNode setScale: 1.3];
                                                              
                                                              [[QGMusicManager manager] playAudio: @"forward"
                                                                                        loopCount: 0];
                                                          })]
         completion: (^
                      {
                          NSInteger randNumber = random();

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

- (void)showBreakAnimation
{
    [self setBreaking: YES];
    
    [self runAction: [SKAction customActionWithDuration: 0.6
                                            actionBlock: (^(SKNode *node, CGFloat elapsedTime)
                                                          {
                                                              VZBubbleNode *bubbleNode = (VZBubbleNode *)node;
                                                              [bubbleNode setScale: 1.5];
                                                              
                                                              SKLabelNode *labelNode = [bubbleNode labelNode];
                                                              [labelNode setFontColor: [SKColor redColor]];
                                                              [labelNode setColor: [SKColor redColor]];
                                                              [labelNode setText: [NSString stringWithFormat: @"-%ld", (long)_number]];
                                                              [labelNode setScale: 1.3];
                                                              
                                                              [[QGMusicManager manager] playAudio: @"forward"
                                                                                        loopCount: 0];
                                                          })]
         completion: (^
                      {
                          [self setBreaking: NO];
                          
                          NSInteger randNumber = rand();

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
        
        NSInteger numberA = rand() % (_number - 1) + 1;
        VZBubbleNode *nodeA = [[VZBubbleNode alloc] initWithSceneSize: size
                                                        currentNumber: _currentNumber];
        [nodeA setNumber: numberA];
        
        [self setNumber: (_number - numberA)];
        
        return nodeA;
    }
    
    return nil;
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"%@ num: %ld",  [super description], (long)_currentNumber];
}

- (void)resetNode
{
    CGSize size = [[self scene] size];
    NSInteger randNumber = random();
    [self setNumber: randNumber % _currentNumber + 1];
    [self setPosition: CGPointMake(15 + randNumber % (NSInteger)(size.width - 15 * 2),
                                   size.height + 50 + 10 * (randNumber % 10))];
}

@end
