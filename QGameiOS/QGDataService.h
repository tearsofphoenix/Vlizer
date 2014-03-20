//
//  QGDataService.h
//  QGame
//
//  Created by Mac003 on 14-3-14.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import <Foundation/Foundation.h>

#define QGServerURL @"http://tearsofphoenix.com/scripts/qgame.php"
#define QGNotificationProductsChanged @"notification.products-changed"

@interface QGDataService : NSObject

+ (id)service;

- (NSInteger)levelCount;

- (NSDictionary *)levelWithIndex: (NSInteger)index;

@property (nonatomic, strong) NSArray *products;

@end
