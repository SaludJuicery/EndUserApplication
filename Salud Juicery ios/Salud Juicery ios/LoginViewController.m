//
//  LoginViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "LoginViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "Settings.h"

#import <GoogleSignIn/GoogleSignIn.h>


static NSString * const kClientId = @"673101349738-h4v98lcg2i45i8cuf899fei7qrv8qtas.apps.googleusercontent.com";


@implementation LoginViewController
{
    BOOL _viewDidAppear;
    BOOL _viewIsVisible;
}

#pragma mark - Object lifecycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // We wire up the FBSDKLoginButton using the interface builder
        // but we could have also explicitly wired its delegate here.
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - View Management

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observeProfileChange:) name:FBSDKProfileDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observeTokenChange:) name:FBSDKAccessTokenDidChangeNotification object:nil];
    self.loginButton.readPermissions = @[@"public_profile", @"user_friends"];
    
    // If there's already a cached token, read the profile information.
    if ([FBSDKAccessToken currentAccessToken]) {
      //  [self observeProfileChange:nil];
    }
    
    
    //Google sigin//
    
    // TODO(developer) Configure the sign-in button look/feel
    
    NSLog(@"view did load:");
    
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignInButton class];
    
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.delegate = self;
    signIn.uiDelegate = self;
    
    //facebook
    
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    
    
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    if (_viewIsVisible) {
       // [self performSegueWithIdentifier:@"continue" sender:self];
    }
}






- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    Settings *settings = [Settings defaultSettings];
    if (_viewDidAppear) {
        _viewIsVisible = YES;
        
        // reset
        settings.shouldSkipLogin = NO;
    } else {
        if (settings.shouldSkipLogin || [FBSDKAccessToken currentAccessToken]) {
           // [self performSegueWithIdentifier:@"showMain" sender:nil];
        } else {
            _viewIsVisible = YES;
        }
        _viewDidAppear = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [Settings defaultSettings].shouldSkipLogin = YES;
    _viewIsVisible = NO;
}

#pragma mark - Actions

- (IBAction)showLogin:(UIStoryboardSegue *)segue
{
    // This method exists in order to create an unwind segue to this controller.
}

#pragma mark - FBSDKLoginButtonDelegate

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    
    NSLog(@"Hi facebook");
    
    
    if (error) {
        NSLog(@"Unexpected login error: %@", error);
        NSString *alertMessage = error.userInfo[FBSDKErrorLocalizedDescriptionKey] ?: @"There was a problem logging in. Please try again later.";
        NSString *alertTitle = error.userInfo[FBSDKErrorLocalizedTitleKey] ?: @"Oops";
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else {
       // if (_viewIsVisible) {
            
            NSString *fbAccessToken = [FBSDKAccessToken currentAccessToken].tokenString;
            NSLog(@"Face access_token:  %@", fbAccessToken);
            
           [self performSegueWithIdentifier:@"showMain" sender:self];
        
    }
}

-(void)loginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    //    NSString *userId = user.userID;                  // For client-side use only!
    //    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    //    NSString *name = user.profile.name;
    //  NSString *email = user.profile.email;
    NSString *accessToken = user.authentication.accessToken;
    // ...
    
    //   NSString *accessToken = user.authentication.accessToken;
    NSLog(@"access_token:%@",accessToken);
    // [self performSegueWithIdentifier:@"mainview" sender:self];
    
    
     [self performSegueWithIdentifier:@"showMain" sender:self];
    
}

- (IBAction)didTapSignOut:(id)sender {
    NSLog(@"sinout:@");
    [[GIDSignIn sharedInstance] signOut];
}




#pragma mark - Observations



- (void)observeProfileChange:(NSNotification *)notfication {
    if ([FBSDKProfile currentProfile]) {
        NSString *title = [NSString stringWithFormat:@"continue as %@", [FBSDKProfile currentProfile].name];
      //  [self.continueButton setTitle:title forState:UIControlStateNormal];
    }
}

- (void)observeTokenChange:(NSNotification *)notfication {
    if (![FBSDKAccessToken currentAccessToken]) {
       // [self.continueButton setTitle:@"continue as a guest" forState:UIControlStateNormal];
    } else {
        [self observeProfileChange:nil];
    }
}
 


@end
