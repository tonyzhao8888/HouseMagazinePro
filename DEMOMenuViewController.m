//
//  DEMOMenuViewController.m
//  RESideMenuExample
//
//  Created by Roman Efimov on 10/10/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOMenuViewController.h"
#import "DEMOFirstViewController.h"
#import "DEMOSecondViewController.h"
#import <UIKit/UIKit.h>

@interface DEMOMenuViewController ()

@property (strong, readwrite, nonatomic) UITableView *tableView;
//下拉控件
@property (strong, nonatomic) IBOutlet UIRefreshControl *refreshControl;


@property (nonatomic, retain) NSMutableArray *arrayResult;

@property (nonatomic, retain) NSMutableArray *arrayPrice;

@property (nonatomic, retain) NSMutableArray *arrayImage;

@property (nonatomic, retain) NSMutableArray *arrayUseid;

@end

@implementation DEMOMenuViewController
@synthesize arrayResult,arrayPrice,arrayImage,arrayUseid;
@synthesize refreshControl;

//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // [self setBackBarItem];
  //  self.title = @"搜索结果";
    //表格控制器类中，编写“下拉刷新代码”
    //如果下拉动作触发，再次获取一次数据
//    [self.refreshControl addTarget:self action:@selector(loadLatestTmallTemaiItemsSearch) forControlEvents:UIControlEventValueChanged];
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width, 54 * 5) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        
        tableView.backgroundView = nil;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            self.sideMenuViewController.contentViewController = [[UINavigationController alloc] initWithRootViewController:[[DEMOFirstViewController alloc] init]];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[DEMOSecondViewController alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    NSArray *titles = @[@"FreeOrder", @"ID", @"Clean", @"AboutUs", @"FeedBack"];
    NSArray *images = @[@"IconHome", @"IconCalendar", @"IconProfile", @"IconSettings", @"IconEmpty"];
    cell.textLabel.text = titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    return cell;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//#pragma mark - 使用GCD和下拉刷新功能
//-(void)loadLatestTmallTemaiItemsSearch{
//    [self.refreshControl beginRefreshing];
//    dispatch_queue_t loaderQ = dispatch_queue_create("TmallItemsSearchLoader", NULL);
//    dispatch_async(loaderQ, ^{
//        //重新获取表格数据，这里为了演示效果，线程延时2秒
//        //[self getData]
//        [NSThread sleepForTimeInterval:100];
//        
//        //停止刷新
//        [self.refreshControl endRefreshing];
//    });
//}


@end
