//
//  HealthshotsListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "HealthshotsListViewController.h"
#import "HealthshotsCell.h"
#import "JuiceDetailViewController.h"

@interface HealthshotsListViewController ()

@property (nonatomic, strong) NSMutableArray *healthshotsArray;


@end

@implementation HealthshotsListViewController



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"HealthshotsListViewController viewWillAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _healthshotsArray = [@[@"photo_sample_01",
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
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HealthshotsCell" bundle:nil] forCellReuseIdentifier:@"HealthshotsCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _healthshotsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"HealthshotsCell";
    HealthshotsCell *cell = (HealthshotsCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.healthshotsImageView.image = [UIImage imageNamed:_healthshotsArray[indexPath.row]];
    cell.healthshotsNameLabel.text = [NSString stringWithFormat:@"healthshots %ld",(long)indexPath.row];
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
