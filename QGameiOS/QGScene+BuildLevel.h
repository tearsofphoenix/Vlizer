//
//  QGScene+BuildLevel.h
//  QGame
//
//  Created by Mac003 on 14-3-13.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGScene.h"

@interface QGScene (BuildLevel)

- (CGFloat)widthForCurrentLevel: (NSDictionary *)info;

- (void)buildWordForScene: (QGScene *)scene
                    level: (NSInteger)index
             initLocation: (NSString *)str;

@end
