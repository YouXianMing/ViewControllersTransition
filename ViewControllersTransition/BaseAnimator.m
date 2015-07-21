//
//  BaseAnimator.m
//  ViewControllersTransition
//
//  Created by YouXianMing on 15/7/21.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "BaseAnimator.h"

@interface BaseAnimator ()

@property (nonatomic, weak) id <UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic, weak) UIViewController  *fromViewController;
@property (nonatomic, weak) UIViewController  *toViewController;
@property (nonatomic, weak) UIView            *containerView;

@end

@implementation BaseAnimator

#pragma mark - 初始化
- (instancetype)init {
    
    self = [super init];
    if (self) {
    
        // 默认参数设置
        [self deafultSet];
    }
    
    return self;
}

- (void)deafultSet {
    
    _transitionDuration = 0.5f;
}

#pragma mark - 动画代理
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return _transitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView      = [transitionContext containerView];
    self.transitionContext  = transitionContext;
    
    [self animateTransitionEvent];
}

- (void)animateTransitionEvent {
    
    /* == 代码示例 ==
     
    UIView *tmpView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.containerView addSubview:self.toViewController.view];
    [self.containerView addSubview:tmpView];
    
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.0f
         usingSpringWithDamping:1 initialSpringVelocity:0.f options:0 animations:^{
             
             tmpView.frame = CGRectMake(0, 0, 100, 100);
             
         } completion:^(BOOL finished) {
             
             [tmpView removeFromSuperview];
             [self completeTransition];
         }];
     */
}

#pragma mark -
- (void)completeTransition {

    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}

@end
