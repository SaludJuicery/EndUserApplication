//
//  AppDelegate.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "AppDelegate.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import <FBSDKShareKit/FBSDKShareKit.h>

#import "Settings.h"

#define GOOGLEPLUS_SCHEME @"salud.dev.Salud-Juicery1"
#define FACEBOOK_SCHEME  @"fb900851463322720"
#define GOOGLE_SCHEME @"com.googleusercontent.apps.673101349738-h4v98lcg2i45i8cuf899fei7qrv8qtas"

#import <GoogleSignIn/GoogleSignIn.h>

#import "Settings.h"



@implementation AppDelegate

#pragma mark - Class Methods

+ (void)initialize
{
    // Nib files require the type to have been loaded before they can do the wireup successfully.
    // http://stackoverflow.com/questions/1725881/unknown-class-myclass-in-interface-builder-file-error-at-runtime
    [FBSDKLoginButton class];
    [FBSDKProfilePictureView class];
   // [FBSDKSendButton class];
   // [FBSDKShareButton class];
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSError* configureError;
    //  [[GGLContext sharedInstance] configureWithError: &configureError];
    
    //Google sigin//
    
  //  NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
    
   [GIDSignIn sharedInstance].clientID = @"673101349738-h4v98lcg2i45i8cuf899fei7qrv8qtas.apps.googleusercontent.com";
    
   // [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    //Google sigin// end
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
  //  [FBSDKLoginButton class];
    
    return YES;
}




-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  /*
    if ([[url scheme] isEqualToString:GOOGLEPLUS_SCHEME])
        return [GPPURLHandler handleURL:url
                      sourceApplication:sourceApplication
                             annotation:annotation];
    */
    if ([[url scheme] isEqualToString:FACEBOOK_SCHEME])
        return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                              openURL:url
                                                    sourceApplication:sourceApplication
                                                           annotation:annotation];
    //Google sigin//
    
    if ([[url scheme] isEqualToString:GOOGLE_SCHEME])
        NSLog(@"access_token:@");
    return [[GIDSignIn sharedInstance] handleURL:url
                               sourceApplication:sourceApplication
                                      annotation:annotation];
    
    
    //Google sigin// end
    
    return NO;
    
}






- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBSDKAppEvents activateApp];
    
    // Do the following if you use Mobile App Engagement Ads to get the deferred
    // app link after your app is installed.
    [FBSDKAppLinkUtility fetchDeferredAppLink:^(NSURL *url, NSError *error) {
        if (error) {
            NSLog(@"Received error while fetching deferred app link %@", error);
        }
        if (url) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }];
}


//google

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    //   NSString *userId = user.userID;                  // For client-side use only!
    //    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    //   NSString *name = user.profile.name;
    //   NSString *email = user.profile.email;
    NSString *accessToken = user.authentication.accessToken;
    // ...
    
    //   NSString *accessToken = user.authentication.accessToken;
    NSLog(@"access_token:%@",accessToken);
    //  [self performSegueWithIdentifier:@"mainview" sender:self];
    
}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}





@end
