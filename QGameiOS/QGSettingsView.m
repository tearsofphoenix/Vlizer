//
//  QGAboutView.m
//  QGame
//
//  Created by Mac003 on 14-3-13.
//  Copyright (c) 2014年 Mac003. All rights reserved.
//

#import "QGSettingsView.h"
#import "QGScene.h"
#import "QGMusicManager.h"

@implementation QGSettingsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor: [UIColor blackColor]];
        
        UILabel *soundLabel = [[UILabel alloc] initWithFrame: CGRectMake(30, 140, 180, 30)];
        [soundLabel setBackgroundColor: [UIColor clearColor]];
        [soundLabel setTextColor: [UIColor whiteColor]];
        [soundLabel setText: @"Disable sound effects:"];
        
        [self addSubview: soundLabel];
        
        UISwitch *soundSwitch = [[UISwitch alloc] initWithFrame: CGRectMake(220, 140, 60, 40)];
        [soundSwitch addTarget: self
                        action: @selector(_handleValueChanged:)
              forControlEvents: UIControlEventValueChanged];
        [self addSubview: soundSwitch];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *value = [defaults stringForKey: QGDisableSoundEffect];
        [soundSwitch setOn: [value boolValue]];
    }
    return self;
}

- (void)contentViewWillDisappear
{
    
}

- (void)_handleValueChanged: (UISwitch *)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: [sender isOn] ? @"YES" : @"NO"
                 forKey: QGDisableSoundEffect];
    [defaults synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName: QGSettingsChangedNotification
                                                        object: nil];
}

@end
