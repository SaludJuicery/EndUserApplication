//
//  JuicesCell.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/6/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "JuicesCell.h"

@implementation JuicesCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    self.item = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
}

- (IBAction)valuechangedJuice:(id)sender {
    
    self.valuecountJuice.text = [NSString stringWithFormat:@"%d",[[NSNumber numberWithDouble:[(UIStepper *)sender value]] intValue]];
}



- (NSAttributedString *)DYAlertPickView:(DYAlertPickView *)pickerView
                            titleForRow:(NSInteger)row{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:self.item[row]];
    return str;
}
- (NSInteger)numberOfRowsInDYAlertPickerView:(DYAlertPickView *)pickerView {
    return self.item.count;
}
- (void)DYAlertPickView:(DYAlertPickView *)pickerView didConfirmWithItemAtRow:(NSInteger)row{
    NSLog(@"%@ didConfirm", self.item[row]);
}

- (void)DYAlertPickerViewDidClickCancelButton:(DYAlertPickView *)pickerView {
    NSLog(@"Canceled");
}

- (void)DYAlertPickerViewDidClickSwitchButton:(DYAlertPickView *)pickerView switchButton:(UISwitch *)switchButton {
    NSLog(@"switch:%@",(switchButton.isOn?@"On":@"Off"));
}


- (BOOL)DYAlertPickerViewStateOfSwitchButton {
    return YES;
}

- (IBAction)showAlertPickerView:(id)sender {
    DYAlertPickView *picker = [[DYAlertPickView alloc] initWithHeaderTitle:@"Title" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm" switchButtonTitle:@"Don't ask me"];
    picker.delegate = self;
    picker.dataSource = self;
    [picker showAndSelectedIndex:3];
}





@end
