//
//  LoyaltyViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "LoyaltyViewController.h"
#import "SWRevealViewController.h"

@interface LoyaltyViewController ()

@end

@implementation LoyaltyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    self.loyaltyImageView.image = [UIImage imageNamed:self.loyaltyFilename];
    
  //  SWRevealViewController *revealViewController = self.revealViewController;
   
    
        [self.sidebarloyaltyButton setTarget: self.revealViewController];
        [self.sidebarloyaltyButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
   
    
}
     
     

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
