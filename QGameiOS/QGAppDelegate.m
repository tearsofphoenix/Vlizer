//
//  QGAppDelegate.m
//  QGameiOS
//
//  Created by Mac003 on 14-3-6.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGAppDelegate.h"
#import "QGGameView.h"
#import "RageIAPHelper.h"
#import "QGMainViewController.h"
#import "QGDataService.h"

@implementation QGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),
                   (^
                    {
                        [QGDataService service];                        
                    }));
    
    _window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    QGMainViewController *viewController = [[QGMainViewController alloc] init];
    [_window setRootViewController: viewController];
    
    [_window makeKeyAndVisible];
    
    [RageIAPHelper sharedInstance];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
//    SKView *view = (SKView *)[[_window rootViewController] view];
//    [view setPaused: YES];
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
//    SKView *view = (SKView *)[[_window rootViewController] view];
//    [view setPaused: YES];
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
//    SKView *view = (SKView *)[[_window rootViewController] view];
//    [view setPaused: NO];
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
//    SKView *view = (SKView *)[[_window rootViewController] view];
//    [view setPaused: NO];
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
//    SKView *view = (SKView *)[[_window rootViewController] view];
//    [view setPaused: YES];
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
