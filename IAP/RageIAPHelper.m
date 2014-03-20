//
//  RageIAPHelper.m
//  In App Rage
//
//  Created by Ray Wenderlich on 9/5/12.
//  Copyright (c) 2012 Razeware LLC. All rights reserved.
//

#import "RageIAPHelper.h"
#import "MFNetworkClient.h"
#import "NSData+CMBExtensions.h"
#import "QGDataService.h"

@implementation RageIAPHelper

+ (RageIAPHelper *)sharedInstance
{
    static dispatch_once_t once;
    static RageIAPHelper * sharedInstance;
    dispatch_once(&once,
                  (^
                   {
                       sharedInstance = [[self alloc] init];

                       [[MFNetworkClient sharedClient] postToURL: [NSURL URLWithString: QGServerURL]
                                                      parameters: nil
                                                        lifeTime: 0
                                                        callback: (^(NSData *data, id error)
                                                                   {
                                                                       NSArray *productIDs = [data JSONObject];
                                                                       if ([productIDs count] > 0)
                                                                       {
                                                                           [sharedInstance setProductIdentifiers: [NSSet setWithArray: productIDs]];
                                                                           [sharedInstance requestProductsWithCompletionHandler: (^(BOOL success, NSArray *products)
                                                                                                                                  {
                                                                                                                                      if (success)
                                                                                                                                      {
                                                                                                                                          NSLog(@"%@", products);
                                                                                                                                          [[QGDataService service] setProducts: products];
                                                                                                                                      }
                                                                                                                                  })];
                                                                       }
                                                                   })];
                   }));
    return sharedInstance;
}

@end
