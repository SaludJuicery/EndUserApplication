//
//  JuicesCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/6/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYAlertPickView.h"

@interface JuicesCell : UITableViewCell< DYAlertPickViewDataSource, DYAlertPickViewDelegate >

@property (nonatomic, strong) IBOutlet UIImageView *juiceImageView;
@property (nonatomic, strong) IBOutlet UILabel *juiceNameLabel;
@property (weak, nonatomic) IBOutlet UIStepper *valuechangedJuice;
@property (weak, nonatomic) IBOutlet UILabel *valuecountJuice;
@property NSArray *item;

@end
