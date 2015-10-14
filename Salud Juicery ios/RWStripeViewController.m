//
//  RWStripeViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/21/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "RWStripeViewController.h"
#import "RWCheckoutCart.h"
#import "RWEmailManager.h"
#import "Stripe.h"

#import "RWCheckoutInputCell.h"
#import "RWCheckoutDisplayCell.h"

#import <AFNetworking/AFNetworking.h>

#define STRIPE_TEST_PUBLIC_KEY @"pk_test_KLwf7zaevAL6TXPl6NAECd59"
#define STRIPE_TEST_POST_URL

@interface RWStripeViewController () <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView* tableView;
@property (strong, nonatomic) IBOutlet UIView* buttonView;
@property (strong, nonatomic) IBOutlet UIButton* completeButton;

@property (strong, nonatomic) UITextField* nameTextField;
@property (strong, nonatomic) UITextField* emailTextField;
@property (strong, nonatomic) UITextField* expirationDateTextField;
@property (strong, nonatomic) UITextField* cardNumber;
@property (strong, nonatomic) UITextField* CVCNumber;

@property (strong, nonatomic) NSArray* monthArray;
@property (strong, nonatomic) NSNumber* selectedMonth;
@property (strong, nonatomic) NSNumber* selectedYear;
@property (strong, nonatomic) UIPickerView *expirationDatePicker;

@property (strong, nonatomic) AFJSONRequestOperation* httpOperation;

@property (strong, nonatomic) STPCard* stripeCard;

@end

@implementation RWStripeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.monthArray = @[@"01 - January", @"02 - February", @"03 - March",
                        @"04 - April", @"05 - May", @"06 - June", @"07 - July", @"08 - August", @"09 - September",
                        @"10 - October", @"11 - November", @"12 - December"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Stripe

- (IBAction)completeButtonTapped:(id)sender {
    
    //1
    self.stripeCard = [[STPCard alloc] init];
    self.stripeCard.name = self.nameTextField.text;
    self.stripeCard.number = self.cardNumber.text;
    self.stripeCard.cvc = self.CVCNumber.text;
    self.stripeCard.expMonth = [self.selectedMonth integerValue];
    self.stripeCard.expYear = [self.selectedYear integerValue];
    
    //2
    if ([self validateCustomerInfo]) {
        [self performStripeOperation];
    }
    
    
}

- (BOOL)validateCustomerInfo {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Please try again"
                                                     message:@"Please enter all required information"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    
    //1. Validate name & email
    if (self.nameTextField.text.length == 0 ||
        self.emailTextField.text.length == 0) {
        
        [alert show];
        return NO;
    }
    
    //2. Validate card number, CVC, expMonth, expYear
    NSError* error = nil;
    [self.stripeCard validateCardReturningError:&error];
    
    //3
    if (error) {
        alert.message = [error localizedDescription];
        [alert show];
        return NO;
    }
    
    return YES;
}
- (void)performStripeOperation {
    
    //1
    self.completeButton.enabled = NO;
    
    //2
    /*
     [Stripe createTokenWithCard:self.stripeCard
     publishableKey:STRIPE_TEST_PUBLIC_KEY
     success:^(STPToken* token) {
     [self postStripeToken:token.tokenId];
     } error:^(NSError* error) {
     [self handleStripeError:error];
     }];
     */
    [Stripe createTokenWithCard:self.stripeCard
                 publishableKey:STRIPE_TEST_PUBLIC_KEY
                     completion:^(STPToken* token, NSError* error) {
                         if(error)
                             [self handleStripeError:error];
                         else
                             [self postStripeToken:token.tokenId];
                     }];
}
- (void)postStripeToken:(NSString* )token {
    //Implement
}

- (void)handleStripeError:(NSError *) error {
    //Implement
}

- (void)chargeDidSucceed {
    //Implement
}

- (void)chargeDidNotSuceed {
    //Implement
}


/* The methods below implement the user interface. You don't need to change anything. */

#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2; // (1) user details, (2) credit card details
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (section == 0) ? @"Customer Info" : @"Credit Card Details";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? 2 : 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    if (section == 0 && row == 0) {
        RWCheckoutInputCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutInputCell"];
        cell.nameLabel.text = @"Name";
        cell.textField.placeholder = @"Required";
        cell.textField.keyboardType = UIKeyboardTypeAlphabet;
        self.nameTextField = cell.textField;
        return cell;
    }
    else if (section == 0 && row == 1) {
        RWCheckoutInputCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutInputCell"];
        cell.nameLabel.text = @"E-mail";
        cell.textField.placeholder = @"Required";
        self.emailTextField = cell.textField;
        cell.textField.keyboardType = UIKeyboardTypeAlphabet;
        return cell;
    }
    else if (section == 1 && row == 0) {
        RWCheckoutInputCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutInputCell"];
        cell.nameLabel.text = @"Card Number";
        cell.textField.placeholder = @"Required";
        cell.textField.keyboardType = UIKeyboardTypeNumberPad;
        self.cardNumber = cell.textField;
        return cell;
    }
    else if (section == 1 && row == 1) {
        RWCheckoutInputCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutInputCell"];
        cell.nameLabel.text = @"Exp. Date";
        cell.textField.text = @"Required";
        cell.textField.textColor = [UIColor lightGrayColor];
        self.expirationDateTextField = cell.textField;
        return cell;
    }
    else if (section == 1 && row == 2) {
        RWCheckoutInputCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutInputCell"];
        cell.nameLabel.text = @"CVC Number";
        cell.textField.placeholder = @"Required";
        self.CVCNumber = cell.textField;
        cell.textField.keyboardType = UIKeyboardTypeNumberPad;
        [self configurePickerView];
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UIPicker data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return (component == 0) ? 12 : 10;
}

#pragma mark - UIPicker delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        //Expiration month
        return self.monthArray[row];
    }
    else {
        //Expiration year
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy"];
        NSInteger currentYear = [[dateFormatter stringFromDate:[NSDate date]] integerValue];
        return [NSString stringWithFormat:@"%i", currentYear + row];
    }
    
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component == 0) {
        self.selectedMonth = @(row + 1);
    }
    else {
        NSString *yearString = [self pickerView:self.expirationDatePicker titleForRow:row forComponent:1];
        self.selectedYear = @([yearString integerValue]);
    }
    
    
    if (!self.selectedMonth) {
        [self.expirationDatePicker selectRow:0 inComponent:0 animated:YES];
        self.selectedMonth = @(1); //Default to January if no selection
    }
    
    if (!self.selectedYear) {
        [self.expirationDatePicker selectRow:0 inComponent:1 animated:YES];
        NSString *yearString = [self pickerView:self.expirationDatePicker titleForRow:0 forComponent:1];
        self.selectedYear = @([yearString integerValue]); //Default to current year if no selection
    }
    
    self.expirationDateTextField.text = [NSString stringWithFormat:@"%@/%@", self.selectedMonth, self.selectedYear];
    self.expirationDateTextField.textColor = [UIColor blackColor];
}

#pragma mark - UIPicker configuration

- (void)configurePickerView {
    self.expirationDatePicker = [[UIPickerView alloc] init];
    self.expirationDatePicker.delegate = self;
    self.expirationDatePicker.dataSource = self;
    self.expirationDatePicker.showsSelectionIndicator = YES;
    
    //Create and configure toolabr that holds "Done button"
    UIToolbar *pickerToolbar = [[UIToolbar alloc] init];
    pickerToolbar.barStyle = UIBarStyleBlackTranslucent;
    [pickerToolbar sizeToFit];
    
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc]
                                          initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                          target:nil
                                          action:nil];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(pickerDoneButtonPressed)];
    
    [pickerToolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    
    
    self.expirationDateTextField.inputView = self.expirationDatePicker;
    self.expirationDateTextField.inputAccessoryView = pickerToolbar;
    self.nameTextField.inputAccessoryView = pickerToolbar;
    self.emailTextField.inputAccessoryView = pickerToolbar;
    self.cardNumber.inputAccessoryView = pickerToolbar;
    self.CVCNumber.inputAccessoryView = pickerToolbar;
}

- (void)pickerDoneButtonPressed {
    [self.view endEditing:YES];
}


@end
