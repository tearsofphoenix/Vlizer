//
//  SKTexture+RectSubtexture.h
//  QGame
//
//  Created by Mac003 on 14-3-12.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKTexture (RectSubtexture)

+ (SKTexture *)textureWithRegularRect: (CGRect)rect
                            inTexture: (SKTexture *)texture;
@end
