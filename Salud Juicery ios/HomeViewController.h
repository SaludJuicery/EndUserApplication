//
//  HomeViewController.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQDropDownTextField.h"

@interface HomeViewController : UIViewController

{
    IBOutlet IQDropDownTextField *textFieldTextPicker;
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (weak, nonatomic) IBOutlet UIButton *locationSelection;



@end
