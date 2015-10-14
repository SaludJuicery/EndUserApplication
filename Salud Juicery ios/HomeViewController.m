//
//  HomeViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Back";
    
 // SWRevealViewController *revealViewController = self.revealViewController;
    
    
    /*
    _sidebarhomeButton.target = self.revealViewController;
    _sidebarhomeButton.action = @selector( revealToggle: );
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
*/
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    
    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
   // textFieldDatePicker.inputAccessoryView = toolbar;
    textFieldTextPicker.inputAccessoryView = toolbar;
  //  textFieldTimePicker.inputAccessoryView = toolbar;
  //  textFieldOptionalTextPicker.inputAccessoryView = toolbar;
    
    textFieldTextPicker.isOptionalDropDown = NO;
    [textFieldTextPicker setItemList:[NSArray arrayWithObjects:@"Shadyside",@"Swickley", nil]];
   // [textFieldOptionalTextPicker setItemList:[NSArray arrayWithObjects:@"London",@"Johannesburg",@"Moscow",@"Mumbai",@"Tokyo",@"Sydney", nil]];
    
  //  [textFieldDatePicker setDropDownMode:IQDropDownModeDatePicker];
    
   // [textFieldTimePicker setDropDownMode:IQDropDownModeTimePicker];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    
    
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
     
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)doneClicked:(UIBarButtonItem*)button
{
    [self.view endEditing:YES];
}


/*


-(IBAction)DropDownTable:(id)sender
{
    TableView.hidden = NO;
    if(TableView.frame.origin.y ==203)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [TableView setFrame:CGRectMake(224, 204, 27, 160)];
        [UIView commitAnimations];
        [self.view TableView];
    }
    
    else if (TableView.frame.origin.y == 204)
    {
        [TableView setFrame:CGRectMake(224, 203, 27, 0)];
        TableView.hidden = YES;
    }
    
    [self.view addSubview:TableActivityLevel];
}

 
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
