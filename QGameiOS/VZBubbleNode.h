//
//  VZBubbleNode.h
//  Vlizer
//
//  Created by Lei on 14-3-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

enum
{
    VZGroundMask = 0x1 < 1,
    VZBubbleMask = 0x1 < 2,
};

typedef uint32_t VZConcatMask;

@interface VZBubbleNode : SKSpriteNode

- (id)initWithSize: (CGSize)size;

- (void)showBreakAnimation;

@end
