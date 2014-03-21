//
//  QGScene+BuildLevel.m
//  QGame
//
//  Created by Mac003 on 14-3-13.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGScene+BuildLevel.h"

@implementation VZScene (BuildLevel)

- (CGFloat)widthForCurrentLevel: (NSDictionary *)info
{
    CGFloat width = QGTileWidth;
    id number = info[@"size"];
    if (number)
    {
        width = [number floatValue];
    }
    
    return width;
}

- (void)buildWordForScene: (VZScene *)scene
                    level: (NSInteger)index
             initLocation: (NSString *)locationString
{
       
}

@end
