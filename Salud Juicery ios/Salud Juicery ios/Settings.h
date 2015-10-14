//
//  Settings.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

+ (instancetype)defaultSettings;

@property (nonatomic, assign) BOOL shouldSkipLogin;

@end
