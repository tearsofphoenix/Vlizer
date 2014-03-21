//
//  QGMyScene.h
//  QGameiOS
//

//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#define QGWallColor [SKColor colorWithRed:0.8 green:0.99 blue:0.44 alpha:1]
#define QGRiverColor [SKColor colorWithRed:0.24 green:0.44 blue:0.65 alpha:1]

#define QGEmptyType '0'
#define QGWallType  '1'
#define QGEndType   '2'
#define QGKeyType   '3'
#define QGDoorType  '4'
#define QGRiverType '5'

#define QGTileWidth 16

#define IsIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define QGPrefix            @"com.veritas.application.ios.qgame."
#define QGPassedLevel       QGPrefix "passed"
#define QGCurrentGameInfo   QGPrefix "current-info"

#define QGPlayerLocationKey @"location"
#define QGLevelKey          @"level"
#define QGMovesKey          @"moves"
#define QGTimeSecondsKey    @"seconds"

@class VZScene;

@protocol QGSceneDelegate <NSObject>

- (void)didScene: (VZScene *)scene
    enteredLevel: (NSInteger)index;

- (void)scene: (VZScene *)scene
  showMessage: (NSString *)message;

- (void)sceneFoundWayOutInCurrentLevel: (VZScene *)scene;

- (void)scenePlayerDieInRiver: (VZScene *)scene;

@end

@interface VZScene : SKScene

@property (nonatomic, weak) id<QGSceneDelegate> delegate;

- (void)enterLevel: (NSInteger)index
              info: (NSDictionary *)info;

- (NSDictionary *)levelInfoAtIndex: (NSInteger)index;

@end
