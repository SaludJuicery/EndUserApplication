//
//  HotbrevCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYAlertPickView.h"

@interface HotbrevCell : UITableViewCell< DYAlertPickViewDataSource, DYAlertPickViewDelegate >

@property (nonatomic, strong) IBOutlet UIImageView *hotbrevImageView;
@property (nonatomic, strong) IBOutlet UILabel *hotbrevNameLabel;
@property (weak, nonatomic) IBOutlet UIStepper *valuechangedHot;
@property (weak, nonatomic) IBOutlet UILabel *valuecountHot;
@property NSArray *item;

@end
