//
//  LoginViewController.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FBSDKLoginKit/FBSDKLoginKit.h>



#import <AddressBook/AddressBook.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>
#import <MediaPlayer/MediaPlayer.h>
#import <Security/Security.h>
#import <SystemConfiguration/SystemConfiguration.h>
//#import <UIKit/UIKit.h>
#import <GoogleSignIn/GoogleSignIn.h>
//#import <UIKit/UIKit.h>






@interface LoginViewController : UIViewController <FBSDKLoginButtonDelegate,GIDSignInUIDelegate>

@property (nonatomic, strong) IBOutlet FBSDKLoginButton *loginButton;
//@property (nonatomic, strong) IBOutlet UIButton *continueButton;

- (IBAction)showLogin:(UIStoryboardSegue *)segue;
@property(weak, nonatomic) IBOutlet UIButton *signOutButton;

@end
