//
//  ViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "ViewController.h"
#import "YSLContainerViewController.h"
#import "JuicesListViewController.h"
#import "BowlsListViewController.h"
#import "HealthshotsListViewController.h"
#import "HotbrevListViewController.h"
#import "SmootheesListViewController.h"
#import "SWRevealViewController.h"
#import "MenuDetailsViewController.h"


@interface ViewController () <YSLContainerViewControllerDelegate>


@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = @"News";
    
    
    
  //  SWRevealViewController *revealViewController = self.revealViewController;
   
    
        [self.sidebarmenuButton setTarget: self.revealViewController];
        [self.sidebarmenuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
     
     
     
     
    
    
    // NavigationBar
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.font = [UIFont fontWithName:@"Futura-Medium" size:19];
    titleView.textColor = [UIColor colorWithRed:0.333333 green:0.333333 blue:0.333333 alpha:1.0];
    titleView.text = @"Menu";
    [titleView sizeToFit];
    titleView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleView;
    
    // SetUp ViewControllers
    
    
    BowlsListViewController *bowlsVC = [[BowlsListViewController alloc]initWithNibName:@"BowlsListViewController" bundle:nil];
    bowlsVC.title = @"Bowls";
    
    JuicesListViewController *juiceListVC = [[JuicesListViewController alloc]initWithNibName:@"JuicesListViewController" bundle:nil];
    juiceListVC.title = @"Juices";
    
    SmootheesListViewController *smootheesVC2 = [[SmootheesListViewController alloc]initWithNibName:@"SmootheesListViewController" bundle:nil];
    smootheesVC2.title = @"Smoothees";
    
  
    
    HealthshotsListViewController *healthVC1 = [[HealthshotsListViewController alloc]initWithNibName:@"HealthshotsListViewController" bundle:nil];
    healthVC1.title = @"Healthshots";
    
    
    
    
    HotbrevListViewController *hotVC3 = [[HotbrevListViewController alloc]initWithNibName:@"HotbrevListViewController" bundle:nil];
    hotVC3.title = @"Hot";
     
    
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    
    
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[bowlsVC,juiceListVC,smootheesVC2,healthVC1,hotVC3]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    
    /*
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[bowlsVC,juiceListVC,healthVC1,smootheesVC2,hotVC3]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
     
     
     
     */
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];
    
    
   
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, self.view.bounds.size.height - 44.0f, self.view.bounds.size.width, 44.0f)];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:toolBar];
    
    UIBarButtonItem *people = [[UIBarButtonItem alloc] initWithTitle:@"people" style:UIBarButtonItemStylePlain target:self action:@selector(tap:)];
    UIBarButtonItem *food = [[UIBarButtonItem alloc] initWithTitle:@"food" style:UIBarButtonItemStylePlain target:self action:@selector(tap:)];
    UIBarButtonItem *nature = [[UIBarButtonItem alloc] initWithTitle:@"nature" style:UIBarButtonItemStylePlain target:self action:@selector(tap:)];
    UIBarButtonItem *Checkout = [[UIBarButtonItem alloc] initWithTitle:@"Checkout" style:UIBarButtonItemStylePlain target:self action:@selector(tap:)];
    UIBarButtonItem *cats = [[UIBarButtonItem alloc] initWithTitle:@"cats" style:UIBarButtonItemStylePlain target:self action:@selector(tap:)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    
  //  lbl1.textColor=[UIColor redColor]; and also change this [lbl1 setFrame:CGRectMake(0,64,100,20)];
    
    
    UILabel *lbl1 = [[UILabel alloc] init];
    [lbl1 setFrame:CGRectMake(0,64,100,20)];
   // lbl1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cart"]];

    lbl1.backgroundColor=[UIColor clearColor];
   lbl1.textColor=[UIColor redColor];
    lbl1.userInteractionEnabled=YES;
    [self.view addSubview:lbl1];
   lbl1.text= @"0";

    UILabel *lbl2 = [[UILabel alloc] init];
    [lbl2 setFrame:CGRectMake(0,64,25,20)];
   lbl2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cart"]];

   // lbl1.backgroundImage=[UIColor clearColor];
    lbl2.textColor=[UIColor redColor];
    lbl2.userInteractionEnabled=YES;
    [self.view addSubview:lbl2];
   // lbl2.text= @"0";
    
    
    UILabel *lbl3 = [[UILabel alloc] init];
    [lbl3 setFrame:CGRectMake(0,64,25,20)];
    lbl3.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dollar"]];
    
    // lbl1.backgroundImage=[UIColor clearColor];
    lbl3.textColor=[UIColor redColor];
    lbl3.userInteractionEnabled=YES;
    [self.view addSubview:lbl3];
    // lbl2.text= @"0";
    
    
    UILabel *lbl4 = [[UILabel alloc] init];
    [lbl4 setFrame:CGRectMake(0,64,25,20)];
  //  lbl2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cart"]];
    
    lbl4.backgroundColor=[UIColor clearColor];
    lbl4.textColor=[UIColor redColor];
    lbl4.userInteractionEnabled=YES;
    [self.view addSubview:lbl4];
    lbl4.text= @"0";
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:lbl1];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:lbl2];
    
    UIBarButtonItem *dollar = [[UIBarButtonItem alloc] initWithCustomView:lbl3];

    UIBarButtonItem *cost = [[UIBarButtonItem alloc] initWithCustomView:lbl4];


    
    
    [toolBar setItems:@[ item2, item , dollar,cost,space, Checkout]];
    
    /*

    toolbar.items = [NSArray arrayWithObject:item];
    
    l.text = @"Hello World";
    
    
    
    
    
    
    
    UIBarButtonItem *lb1 = [[UIBarButtonItem alloc] [[initWithCustomView:containerVC.ViewController]]];
                            
    

 //   [toolBar setItems:@[space, people, food, nature, sports, cats, space]];
    
    
     [toolBar setItems:@[space, lbl1, people, food, nature, sports, cats, space]];
    
   */
    
    /*new code*/
    /*
    
    [[UIBarButtonItem alloc] initWithCustomView:containerVC.view];
    
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [items addObject:spacer];
    [spacer release];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 11.0f, self.view.frame.size.width, 21.0f)];
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setTextColor:[UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:1.0]];
    [self.titleLabel setText:@"Title"];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    UIBarButtonItem *spacer2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [items addObject:spacer2];
    [spacer2 release];
    
    UIBarButtonItem *title = [[UIBarButtonItem alloc] initWithCustomView:self.titleLabel];
    [items addObject:title];
    [title release];
    
    [self.toolbar setItems:items animated:YES];
    [items release];
    
   */
    
    /*
    
    
    [[UIBarButtonItem alloc] initWithCustomView:containerVC.view];
    
   // UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 11.0f, self.view.frame.size.width, 21.0f)];
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setTextColor:[UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:1.0]];
    [self.titleLabel setText:@"Title"];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(140 , 0, 50, 250)];
    [label setBackgroundColor:[UIColor clearColor]];
    label.text = @"TEXT";
    UIView *view = (UIView *) label;
    [self.titleLabel setCustomView:containerVC.view];

    
    UIBarButtonItem *title = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    [items addObject:title];
    [title release];
    
   */

    
    
}


- (IBAction) buttonTapped: (UIButton*) Checkout
{
    
     NSLog(@"checkoutttt:");
    
   
    
    
    
}



#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    //    NSLog(@"current Index : %ld",(long)index);
    //    NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
}

- (void)tap:(UIBarButtonItem *)item{
    NSLog(@"item : %@", item.title);
  //  self.category = item.title;
    
    
     //UIViewController *details = [[UIViewController alloc] init];
    
    MenuDetailsViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MenuDetailsViewController"];
    [self.navigationController pushViewController:wc animated:YES];

    
}


@end
