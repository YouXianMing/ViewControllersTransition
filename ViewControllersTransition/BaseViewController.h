//
//  BaseViewController.h
//  BaseController
//
//  Created by YouXianMing on 15/7/16.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController <UIGestureRecognizerDelegate>

/**
 *  默认配置
 */
- (void)defaultConfig;

/////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 *  ==== 注意 ====
 *
 *  此方法只能够在当做 UINavigationController 的 RootViewController 才能够使用,否则会导致bug.使用此方法的场景
 *  是在即使没有导航栏,也可以用手势返回.需要配合参数 useInteractivePopGestureRecognizer 一起使用.
 *
 *  激活手势返回
 */
- (void)useInteractivePopGestureRecognizer;

/**
 *  是否支持返回手势(适用于UINavigationController推出来控制器的场景)
 */
@property (nonatomic)  BOOL  enableInteractivePopGestureRecognizer;

/**
 *  获取所有 navigationController 中的所有入栈的控制器
 *
 *  @return 控制器数组
 */
- (NSArray *)navigationControllerSubControllers;

/**
 *  返回到指定控制器中
 *
 *  @param controller 指定控制器
 *  @param animated   是否执行动画
 */
- (void)backToViewController:(UIViewController *)controller animated:(BOOL)animated;

/**
 *  返回到根控制器
 */
- (void)backToRootViewControllerAnimated:(BOOL)animated;

/**
 *  返回到上一级控制器
 *
 *  @param animated 是否执行动画
 */
- (void)backAnimated:(BOOL)animated;

/////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 *  *  ==== 由子类重写 ====
 *
 *  刷新数据(跨控制器调用,比方说需要前面某个控制器刷新数据或者是执行某种操作等等)
 *
 *  @param message 信息对象
 */
- (void)refreshDataWithMessage:(id)message;

/////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 *  将当前控制器按照一个key值进行注册
 *
 *  @param key 注册的key值
 */
- (void)registerControllerWithKey:(NSString *)key;

/**
 *  根据key值获取控制器
 *
 *  @param key 注册过的key值
 *
 *  @return 获取的控制器
 */
- (id)controllerWithKey:(NSString *)key;

/**
 *  获取所有注册控制器的key值
 *
 *  @return 所有注册的key值
 */
- (NSArray *)allRegisterControllerKeys;



@end
