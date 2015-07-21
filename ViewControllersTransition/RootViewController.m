//
//  RootViewController.m
//  ViewControllersTransition
//
//  Created by YouXianMing on 15/7/21.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "RootViewController.h"
#import "GlobalValue.h"
#import "UIButton+inits.h"
#import "SecondViewController.h"
#import "PushAnimator.h"

@interface RootViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setup];
    
    [self initViews];
}

- (void)setup {
    
    // 获取手势代理
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)initViews {

    self.imageView = [[UIImageView alloc] initWithFrame:IMAGE_FRAME_NORMAL
                                                  image:SHOW_IMAGE];
    [self.view addSubview:self.imageView];
    
    
    // 按钮
    UIButton *pushButton = [UIButton createButtonWithFrame:CGRectMake(Width - 100, Height - 40, 90, 30)
                                                buttonType:BUTTON_NORMAL
                                                     title:@"Push"
                                                       tag:0
                                                    target:self
                                                    action:@selector(buttonsEvent:)];
    [self.view addSubview:pushButton];
}

- (void)buttonsEvent:(UIButton *)button {
    
    [self.navigationController pushViewController:[SecondViewController new]
                                         animated:YES];
}

#pragma mark - 动画代理
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    
    if ([toVC isKindOfClass:[SecondViewController class]]) {
        
        PushAnimator *transition = [[PushAnimator alloc] init];
        return transition;
        
    }else{
        
        return nil;
    }
}

#pragma mark -

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.imageView.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    // 关闭手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    self.navigationController.delegate = self;
    
    self.imageView.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.imageView.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];
    
    // 激活手势
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

@end
