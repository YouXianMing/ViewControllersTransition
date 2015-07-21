//
//  BaseViewController.m
//  BaseController
//
//  Created by YouXianMing on 15/7/16.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "BaseViewController.h"

static NSMapTable  *_weakDictionaryForControllers = nil;

@interface BaseViewController ()

@end

@implementation BaseViewController

+ (void)initialize {
    
    if (self == [BaseViewController class]) {
        
        _weakDictionaryForControllers = [NSMapTable strongToWeakObjectsMapTable];
    }
}

#pragma mark - 注册控制器信息
- (void)registerControllerWithKey:(NSString *)key {

    [_weakDictionaryForControllers setObject:self forKey:key];
}

- (id)controllerWithKey:(NSString *)key {

    return [_weakDictionaryForControllers objectForKey:key];
}

- (NSArray *)allRegisterControllerKeys {

    NSEnumerator   *enumerator = [_weakDictionaryForControllers keyEnumerator];
    NSMutableArray *keysArray  = [NSMutableArray array];
    
    id thing = nil;
    while (thing = [enumerator nextObject]) {
    
        [keysArray addObject:thing];
    }
    
    return [NSArray arrayWithArray:keysArray];
}

#pragma mark - 初始化开始
- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self defaultConfig];
}

/**
 *  默认配置
 */
- (void)defaultConfig {

    // 设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
}

/**
 *  资源释放
 */
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)refreshDataWithMessage:(id)message {

}

- (void)useInteractivePopGestureRecognizer {

    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)backToRootViewControllerAnimated:(BOOL)animated {

    [self.navigationController popToRootViewControllerAnimated:animated];
}

- (void)backAnimated:(BOOL)animated {

    [self.navigationController popViewControllerAnimated:animated];
}

- (NSArray *)navigationControllerSubControllers {

    return self.navigationController.viewControllers;
}

- (void)backToViewController:(UIViewController *)controller animated:(BOOL)animated {

    [self.navigationController popToViewController:controller animated:animated];
}

#pragma mark - 重写setter,getter方法
@synthesize enableInteractivePopGestureRecognizer = _enableInteractivePopGestureRecognizer;

- (void)setEnableInteractivePopGestureRecognizer:(BOOL)enableInteractivePopGestureRecognizer {

    _enableInteractivePopGestureRecognizer = enableInteractivePopGestureRecognizer;
    self.navigationController.interactivePopGestureRecognizer.enabled = enableInteractivePopGestureRecognizer;
}

- (BOOL)enableInteractivePopGestureRecognizer {

    return _enableInteractivePopGestureRecognizer;
}

@end
