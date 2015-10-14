//
//  Settings.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "Settings.h"

@implementation Settings

#pragma mark - Class Methods

+ (instancetype)defaultSettings
{
    static Settings *settings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        settings = [[self alloc] init];
    });
    return settings;
}

#pragma mark - Properties

static NSString *const kShouldSkipLoginKey = @"shouldSkipLogin";

- (BOOL)shouldSkipLogin
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kShouldSkipLoginKey];
}

- (void)setShouldSkipLogin:(BOOL)shouldSkipLogin
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:shouldSkipLogin forKey:kShouldSkipLoginKey];
    [defaults synchronize];
}

@end
