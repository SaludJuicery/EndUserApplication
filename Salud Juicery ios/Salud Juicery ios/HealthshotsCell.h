//
//  HealthshotsCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYAlertPickView.h"


@interface HealthshotsCell : UITableViewCell< DYAlertPickViewDataSource, DYAlertPickViewDelegate >

@property (nonatomic, strong) IBOutlet UIImageView *healthshotsImageView;
@property (nonatomic, strong) IBOutlet UILabel *healthshotsNameLabel;
@property (weak, nonatomic) IBOutlet UIStepper *healthvaluechanged;
@property (weak, nonatomic) IBOutlet UILabel *healthCount;
@property NSArray *item;

@end
