//
//  BowlsListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/6/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "BowlsListViewController.h"
#import "BowlsCell.h"
#import "JuiceDetailViewController.h"

@interface BowlsListViewController ()

@property (nonatomic, strong) NSMutableArray *bowlsArray;

@property NSArray *item;

@end

@implementation BowlsListViewController



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"BowlsListViewController viewWillAppear");
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    _bowlsArray = [@[@"photo_sample_01",
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
    
    self.item = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BowlsCell" bundle:nil] forCellReuseIdentifier:@"BowlsCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _bowlsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"BowlsCell";
    BowlsCell *cell = (BowlsCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.bowlImageView.image = [UIImage imageNamed:_bowlsArray[indexPath.row]];
    cell.bowlNameLabel.text = [NSString stringWithFormat:@"Bowls %ld",(long)indexPath.row];
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
