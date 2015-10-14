//
//  JuicesListViewController.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/6/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myJson.h"

@interface JuicesListViewController : UITableViewController<myJsonDelegate>


@property (nonatomic, retain) NSMutableArray *juices;

@end
