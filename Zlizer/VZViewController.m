//
//  VZViewController.m
//  Zlizer
//
//  Created by Mac003 on 14-3-20.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VZViewController.h"

@interface VZViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation VZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [[NSBundle mainBundle] URLForResource: @"Zlizer"
                                         withExtension: @"html"
                                          subdirectory: @"web"];
    
    _webView = [[UIWebView alloc] initWithFrame: [[self view] bounds]];
//    [_webView setDelegate: self];
    [_webView loadRequest: [NSURLRequest requestWithURL: url]];
    
    [[self view] addSubview: _webView];
}

- (BOOL)webView: (UIWebView *)webView
shouldStartLoadWithRequest: (NSURLRequest *)request
 navigationType: (UIWebViewNavigationType)navigationType
{
    return YES;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
