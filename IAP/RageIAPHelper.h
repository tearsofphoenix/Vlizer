//
//  RageIAPHelper.h
//  In App Rage
//
//  Created by Ray Wenderlich on 9/5/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

#import "IAPHelper.h"

#define QGUnlockProductID @"com.veritas.application.ios.qgame.level_unlock"

@interface RageIAPHelper : IAPHelper

+ (RageIAPHelper *)sharedInstance;

@end
