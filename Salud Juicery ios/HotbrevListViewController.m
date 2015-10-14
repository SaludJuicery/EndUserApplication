//
//  HotbrevListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "HotbrevListViewController.h"
#import "HotbrevCell.h"
#import "JuiceDetailViewController.h"

@interface HotbrevListViewController ()

@property (nonatomic, strong) NSMutableArray *hotbrevArray;


@end

@implementation HotbrevListViewController

//
//  SmootheesListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"HotbrevListViewController viewWillAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _hotbrevArray = [@[@"photo_sample_01",
                         @"photo_sample_02",
                         @"photo_sample_03",
                         @"photo_sample_04",
                         @"photo_sample_05",
                         @"photo_sample_06",
                         @"photo_sample_07",
                         @"photo_sample_08",
                         @"photo_sample_01",
                         @"photo_sample_02",
                         @"photo_sample_03",
                         @"photo_sample_04",
                         @"photo_sample_05",
                         @"photo_sample_06",
                         @"photo_sample_07",
                         @"photo_sample_08",] mutableCopy];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HotbrevCell" bundle:nil] forCellReuseIdentifier:@"HotbrevCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _hotbrevArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"HotbrevCell";
    HotbrevCell *cell = (HotbrevCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.hotbrevImageView.image = [UIImage imageNamed:_hotbrevArray[indexPath.row]];
    cell.hotbrevNameLabel.text = [NSString stringWithFormat:@"Hotbrev %ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JuiceDetailViewController *detailVC = [[JuiceDetailViewController alloc]initWithNibName:@"JuiceDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
