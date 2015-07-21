//
//  PresentAnimator.m
//  ViewControllersTransition
//
//  Created by YouXianMing on 15/7/21.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "PresentAnimator.h"

@implementation PresentAnimator

- (void)animateTransitionEvent {
    
    // 当前控制器的view
    UIView *currentView   = self.fromViewController.view;
    currentView.transform = CGAffineTransformMakeScale(1.f, 1.f);
    
    // 变化的控制器的view
    UIView *toView = self.toViewController.view;
    toView.y       = Height;
    
    // 管理容器 + 添加toView
    [self.containerView addSubview:toView];

    // 执行动画
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.f
         usingSpringWithDamping:1.f
          initialSpringVelocity:0.f
                        options:0
                     animations:^{
                         currentView.transform = CGAffineTransformMakeScale(0.98, 0.98);
                         toView.center         = self.containerView.center;
                     }
                     completion:^(BOOL finished) {
                         [self completeTransition];
                     }];
}

@end
