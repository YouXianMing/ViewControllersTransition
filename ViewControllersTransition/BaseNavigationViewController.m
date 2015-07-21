//
//  BaseNavigationViewController.m
//  BaseController
//
//  Created by YouXianMing on 15/7/17.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self defaultConfig];
}

/**
 *  默认配置
 */
- (void)defaultConfig {
    
}

/**
 *  资源释放
 */
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark - 新添加方法

- (instancetype)initWithRootViewController:(BaseViewController *)rootViewController setNavigationBarHidden:(BOOL)hidden {

    BaseNavigationViewController *ncController = [[[self class] alloc] initWithRootViewController:rootViewController];
    [rootViewController useInteractivePopGestureRecognizer];
    
    [ncController setNavigationBarHidden:hidden animated:NO];
    
    return ncController;
}

@end
