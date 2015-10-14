//
//  MenuViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "MenuViewController.h"

#import "Utility.h"


@interface MenuViewController()


@property (nonatomic, strong) UIView *activityOverlayView;

@end


@implementation MenuViewController



- (void)shareUtilityUserShouldLogin:(Utility *)shareUtility
{
    [self _stopActivityIndicator];
    [self performSegueWithIdentifier:@"showLogin" sender:nil];
}

- (void)setActivityOverlayView:(UIView *)activityOverlayView
{
    if (_activityOverlayView != activityOverlayView) {
        [_activityOverlayView removeFromSuperview];
        _activityOverlayView = activityOverlayView;
    }
}




- (void)_startActivityIndicator
{
    UIView *view = self.view;
    CGRect bounds = view.bounds;
    UIView *activityOverlayView = [[UIView alloc] initWithFrame:bounds];
    activityOverlayView.backgroundColor = [UIColor colorWithWhite:0.65 alpha:0.5];
    activityOverlayView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.activityOverlayView = activityOverlayView;
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    activityIndicatorView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                              UIViewAutoresizingFlexibleRightMargin |
                                              UIViewAutoresizingFlexibleBottomMargin |
                                              UIViewAutoresizingFlexibleLeftMargin);
    [activityOverlayView addSubview:activityIndicatorView];
    [view addSubview:activityOverlayView];
    [activityIndicatorView startAnimating];
}



- (void)_stopActivityIndicator
{
    self.activityOverlayView = nil;
}


@end
