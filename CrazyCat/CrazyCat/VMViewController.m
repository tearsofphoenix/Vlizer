//
//  VMViewController.m
//  CrazyCat
//
//  Created by Mac003 on 14-7-24.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "VMViewController.h"
#import "NSURL+Extensions.h"
#import "UIDevice+Extensions.h"
#import "UIImage+SubimageExtraction.h"
#import "WXApi.h"

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
    [_webView setDelegate: self];
    [[self view] addSubview: _webView];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - delegate

- (UIImage *)snapshot
{
    CGRect bounds = [_webView bounds];
    UIGraphicsBeginImageContext(bounds.size);
    
    if ([UIDevice systemVersionGreaterThanOrEqual: @"7"])
    {
        [_webView drawViewHierarchyInRect: bounds
                       afterScreenUpdates: YES];
    }else
    {
        [[_webView layer] renderInContext: (__bridge CGContextRef)(UIGraphicsGetImageFromCurrentImageContext())];
    }

    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return snapshotImage;
}

- (BOOL)           webView: (UIWebView *)webView
shouldStartLoadWithRequest: (NSURLRequest *)request
            navigationType: (UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];
    if ([[url scheme] isEqualToString: @"crazycat"])
    {
        NSDictionary *args = [url queryDictionary];
        
        if ([args[@"arg"] isEqualToString: @"share"])
        {
            WXMediaMessage *message = [WXMediaMessage message];
            
            UIImage *image = [self snapshot];
            UIImage *thumbnail = [image resizedImageWithSize: CGSizeMake(64, 64)];
            
            [message setThumbImage: thumbnail];
            
            WXImageObject *ext = [WXImageObject object];

            ext.imageData = UIImageJPEGRepresentation(image, 1);
            
            message.mediaObject = ext;
            
            SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
            req.bText = NO;
            req.message = message;
            req.scene = WXSceneTimeline;
            
            [WXApi sendReq:req];
        }
        
        NSLog(@"%@ %@ %@ %@", url, [url scheme], [url host], [url query]);
        
        return NO;
    }
    
    return YES;
}

@end
