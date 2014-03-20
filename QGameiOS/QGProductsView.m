//
//  QGLevelsView.m
//  QGame
//
//  Created by Lei on 14-3-18.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGProductsView.h"
#import "QGDataService.h"
#import "RageIAPHelper.h"
#import <StoreKit/StoreKit.h>

@interface QGProductsView ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
}
@end

@implementation QGProductsView

- (id)initWithFrame: (CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self)
    {
        [self setBackgroundColor: [UIColor blackColor]];
        
        CGRect bounds = [self bounds];
        bounds.origin.y += 80;
        bounds.size.height -= bounds.origin.y;
        
        _tableView = [[UITableView alloc] initWithFrame: bounds];
        [_tableView setDataSource: self];
        [_tableView setDelegate: self];
        [_tableView setBackgroundColor: [UIColor clearColor]];
        
        [self addSubview: _tableView];
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(_notificationForProducts:)
                                                     name: QGNotificationProductsChanged
                                                   object: nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void)contentViewWillDisappear
{
    
}

- (NSInteger)tableView: (UITableView *)tableView
 numberOfRowsInSection: (NSInteger)section
{
    return [[[QGDataService service] products] count];
}

- (UITableViewCell *)tableView: (UITableView *)tableView
         cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    NSArray *products = [[QGDataService service] products];
    SKProduct *info = products[[indexPath row]];
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    NSString *content = [NSString stringWithFormat: @"%@ price: %.2f%@", [info localizedTitle], [[info price] doubleValue], [[info priceLocale] objectForKey: NSLocaleCurrencySymbol]];
    [[cell textLabel] setText: content];
    
    return cell;
}

- (void)      tableView: (UITableView *)tableView
didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
    NSArray *products = [[QGDataService service] products];
    SKProduct *info = products[[indexPath row]];

    [[RageIAPHelper sharedInstance] buyProduct: info];
}

- (CGFloat)   tableView: (UITableView *)tableView
heightForRowAtIndexPath: (NSIndexPath *)indexPath
{
    return 50;
}

- (void)_notificationForProducts: (NSNotification *)notification
{
    [_tableView reloadData];
}

@end
