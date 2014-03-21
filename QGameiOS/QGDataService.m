//
//  QGDataService.m
//  QGame
//
//  Created by Mac003 on 14-3-14.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGDataService.h"
#import "MFNetworkClient.h"
#import "NSData+CMBExtensions.h"

@interface QGDataService ()
{
    NSArray *_levels;
}
@end

@implementation QGDataService

+ (id)service
{
    static id service = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
                  (^
                   {
                       service = [[self alloc] init];
                   }));
    
    return service;
}

- (id)init
{
    if ((self = [super init]))
    {
        
    }
    
    return self;
}

- (NSInteger)levelCount
{
    return [_levels count];
}

- (NSDictionary *)levelWithIndex: (NSInteger)index
{
    if (index < [_levels count])
    {
        return _levels[index];
    }
    
    return nil;
}

- (void)setProducts: (NSArray *)products
{
    if (_products != products)
    {
        _products = products;
        
        [[NSNotificationCenter defaultCenter] postNotificationName: QGNotificationProductsChanged
                                                            object: self];
    }
}

@end
