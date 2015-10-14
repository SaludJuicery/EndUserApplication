//
//  Utility.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import <FBSDKShareKit/FBSDKShareKit.h>


@interface Utility : NSObject <UIActionSheetDelegate, FBSDKSharingDelegate>

@end


@protocol SCShareUtilityDelegate

//- (void)shareUtility:(SCShareUtility *)shareUtility didFailWithError:(NSError *)error;
//- (void)shareUtilityWillShare:(SCShareUtility *)shareUtility;
//- (void)shareUtilityDidCompleteShare:(SCShareUtility *)shareUtility;
- (void)shareUtilityUserShouldLogin:(Utility *)shareUtility;

@end