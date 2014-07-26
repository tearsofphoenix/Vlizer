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
#import "NSDictionary+Extensions.h"
#import "WXApi.h"
#import "AFNetworking.h"
#import <AVFoundation/AVFoundation.h>

static NSString * const kServerURL = @"http://jewery.info/crazycat/cat.php";

@interface VMViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation VMViewController

+ (void)initialize
{
    NSString *key = @"com.veritas.application.ios.crazycat.record.device";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *record = [defaults objectForKey: key];
    
    if (![record boolValue])
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        UIDevice *device = [UIDevice currentDevice];
        dict[@"device_id"] = [[device identifierForVendor] UUIDString];
        dict[@"platform"] = [device platform];
        
        NSString *name = [device name];
        dict[@"name"] = [name stringByReplacingOccurrencesOfString: @"'"
                                                        withString: @""];
        dict[@"model"] = [device model];
        dict[@"system_version"] = [device systemVersion];
        dict[@"system_name"] = [device systemName];
        
        dict[@"action"] = @"save_device";
        
        NSLog(@"%@", [kServerURL stringByAppendingString: [dict queryURLString]]);
        
        AFHTTPRequestOperation *operation = nil;
        operation = [[AFHTTPRequestOperationManager manager] POST: kServerURL
                                                       parameters: dict
                                                          success: (^(AFHTTPRequestOperation *operation, id responseObject)
                                                                    {
                                                                        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData: responseObject
                                                                                                                            options: 0
                                                                                                                              error: NULL];
                                                                        if (obj && [obj[@"status"] integerValue] == 0)
                                                                        {
                                                                            [defaults setObject: @"YES"
                                                                                         forKey: key];
                                                                            [defaults synchronize];
                                                                        }
                                                                    })
                                                          failure: (^(AFHTTPRequestOperation *operation, NSError *error)
                                                                    {
                                                                        NSLog(@"%@", [error localizedDescription]);
                                                                    })];
        AFHTTPResponseSerializer *s = [AFHTTPResponseSerializer serializer];
        [s setAcceptableContentTypes: [NSSet setWithObject: @"text/html"]];
        
        [operation setResponseSerializer: s];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect bounds = [[self view] bounds];
    
    _webView = [[UIWebView alloc] initWithFrame: bounds];
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource: @"launcher"
                                         withExtension: @"html"
                                          subdirectory: @"sjm"];
    [_webView loadRequest: [NSURLRequest requestWithURL: URL]];
    [_webView setDelegate: self];
    [[self view] addSubview: _webView];
    
    
    _imageView = [[UIImageView alloc] initWithFrame: bounds];
    if ([UIDevice isiPhone5])
    {
        [_imageView setImage: [UIImage imageNamed: @"bg640x1136"]];
    }else
    {
        [_imageView setImage: [UIImage imageNamed: @"bg640x960"]];
    }
    
    [[self view] addSubview: _imageView];
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

- (void)webViewDidFinishLoad: (UIWebView *)webView
{
    [_imageView setAlpha: 0];
    [_imageView removeFromSuperview];
    [self setImageView: nil];
    
    NSURL *URL = [[NSBundle mainBundle] URLForResource: @"background"
                                         withExtension: @"mp3"];
    NSError *error = nil;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: URL
                                                          error: &error];
    if (error)
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback
                                           error: &error];
    
    if (error)
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [[AVAudioSession sharedInstance] setActive: YES
                                         error: &error];
    
    if (error)
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    [_audioPlayer setVolume: 0.7];
    [_audioPlayer setNumberOfLoops: -1];
    [_audioPlayer play];
}

- (BOOL)           webView: (UIWebView *)webView
shouldStartLoadWithRequest: (NSURLRequest *)request
            navigationType: (UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];
    if ([[url scheme] isEqualToString: @"crazycat"])
    {
        NSDictionary *args = [url queryDictionary];
        NSString *type = args[@"arg"];
        
        if ([type isEqualToString: @"share"])
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
            
        }else if ([type isEqualToString: @"start_game"])
        {
            [_audioPlayer play];
            
        }else if ([type isEqualToString: @"end_game"])
        {
            [_audioPlayer stop];
            
            NSDictionary *dict = (@{
                                    @"action" : @"save_record",
                                    @"device_id" : [[[UIDevice currentDevice] identifierForVendor] UUIDString],
                                    @"tap" : [args[@"tap"] description],
                                    });
            
            NSLog(@"%@", [kServerURL stringByAppendingString: [dict queryURLString]]);
            
            AFHTTPRequestOperation *operation = nil;
            operation = [[AFHTTPRequestOperationManager manager] POST: kServerURL
                                                           parameters: dict
                                                              success: (^(AFHTTPRequestOperation *operation, id responseObject)
                                                                        {
                                                                            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData: responseObject
                                                                                                                                options: 0
                                                                                                                                  error: NULL];
                                                                            if (obj && [obj[@"status"] integerValue] == 0)
                                                                            {
                                                                                NSLog(@"%@", obj);
                                                                            }
                                                                        })
                                                              failure: (^(AFHTTPRequestOperation *operation, NSError *error)
                                                                        {
                                                                            NSLog(@"%@", [error localizedDescription]);
                                                                        })];
            
            AFHTTPResponseSerializer *s = [AFHTTPResponseSerializer serializer];
            [s setAcceptableContentTypes: [NSSet setWithObject: @"text/html"]];
            
            [operation setResponseSerializer: s];
        }
        
        //        NSLog(@"%@ %@ %@ %@", url, [url scheme], [url host], [url query]);
        
        return NO;
    }
    
    return YES;
}

@end
