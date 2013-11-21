//
//  MYLAppDelegate.m
//  HouseMagazinePro
//
//  Created by Yubk on 13-11-20.
//  Copyright (c) 2013年 Yubk. All rights reserved.
//

#import "MYLAppDelegate.h"
#import "DEMOFirstViewController.h"
#import "DEMOMenuViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation MYLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[DEMOFirstViewController alloc] init]];
    UIImage *backImg1 = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"NavBG" ofType:@"png"]];
        [navigationController.navigationBar setBackgroundImage:backImg1 forBarMetrics:UIBarMetricsDefault];
    DEMOMenuViewController *menuViewController = [[DEMOMenuViewController alloc] init];
   
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController menuViewController:menuViewController];
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"MenuBG.jpg"];
    sideMenuViewController.delegate = self;
    self.window.rootViewController = sideMenuViewController;
    [self.window makeKeyAndVisible];
    
    fView =[[UIImageView alloc]initWithFrame:self.window.frame];//初始化fView
    fView.image=[UIImage imageNamed:@"f.png"];//图片f.png 到fView
    
    zView=[[UIImageView alloc]initWithFrame:self.window.frame];//初始化zView
    zView.image=[UIImage imageNamed:@"z.png"];//图片z.png 到zView
    
    rView=[[UIView alloc]initWithFrame:self.window.frame];//初始化rView
    
    [rView addSubview:fView];//add 到rView
    [rView addSubview:zView];//add 到rView
    
    [self.window addSubview:rView];//add 到window
    
    [self performSelector:@selector(TheAnimation) withObject:nil afterDelay:5];//5秒后执行TheAnimation
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)TheAnimation{
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.7 ;  // 动画持续时间(秒)
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionFade;//淡入淡出效果
    
    NSUInteger f = [[rView subviews] indexOfObject:fView];
    NSUInteger z = [[rView subviews] indexOfObject:zView];
    [rView exchangeSubviewAtIndex:z withSubviewAtIndex:f];
    
    [[rView layer] addAnimation:animation forKey:@"animation"];
    
    [self performSelector:@selector(ToUpSide) withObject:nil afterDelay:2];//2秒后执行TheAnimation
}

#pragma mark - 上升效果
- (void)ToUpSide {
    
    [self moveToUpSide];//向上拉界面
    
}

- (void)moveToUpSide {
    [UIView animateWithDuration:0.7 //速度0.7秒
                     animations:^{//修改rView坐标
                         rView.frame = CGRectMake(self.window.frame.origin.x,
                                                  -self.window.frame.size.height,
                                                  self.window.frame.size.width,
                                                  self.window.frame.size.height);
                     }
                     completion:^(BOOL finished){
                     }];
    
}

#pragma mark RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController");
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController");
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController");
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController");
}

#pragma mark -
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
