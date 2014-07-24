//
//  VMViewController.m
//  CrazyCat
//
//  Created by Mac003 on 14-7-24.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VMViewController.h"

@interface VMViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation VMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] initWithFrame: [[self view] bounds]];
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource: @"launcher"
                                         withExtension: @"html"
                                          subdirectory: @"sjm"];
    [_webView loadRequest: [NSURLRequest requestWithURL: URL]];
    
    [[self view] addSubview: _webView];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
