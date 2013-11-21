//
//  MYLViewController.m
//  HouseMagazinePro
//
//  Created by Yubk on 13-11-20.
//  Copyright (c) 2013年 Yubk. All rights reserved.
//

#import "DEMOFirstViewController.h"
#import "DEMOMenuViewController.h"
@interface DEMOFirstViewController ()

@end

@implementation DEMOFirstViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
	self.title = @"House";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(showMenu)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
//    imageView.image = [UIImage imageNamed:@"20130719103712941.jpg"];
    [self.view addSubview:imageView];
}

- (void)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

@end
