//
//  QGScene+BuildLevel.h
//  QGame
//
//  Created by Mac003 on 14-3-13.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZScene.h"

@interface VZScene (BuildLevel)

- (CGFloat)widthForCurrentLevel: (NSDictionary *)info;

- (void)buildWordForScene: (VZScene *)scene
                    level: (NSInteger)index
             initLocation: (NSString *)str;

@end
