//
//  QGViewController.h
//  QGameiOS
//

//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@protocol QGContentView <NSObject>

- (void)contentViewWillDisappear;

@end

@interface QGGameView : SKView<QGContentView>

- (void)enterLevel: (NSInteger)index
              info: (NSDictionary *)info;

@end
