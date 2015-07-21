//
//  BaseNavigationViewController.h
//  BaseController
//
//  Created by YouXianMing on 15/7/17.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BaseNavigationViewController : UINavigationController

/**
 *  默认配置
 */
- (void)defaultConfig;

/**
 *  初始化导航栏控制器，并设置是否隐藏导航栏
 *
 *  @param rootViewController 根控制器
 *  @param hidden             是否隐藏导航栏
 *
 *  @return 初始化好的对象
 */
- (instancetype)initWithRootViewController:(BaseViewController *)rootViewController setNavigationBarHidden:(BOOL)hidden;

@end
