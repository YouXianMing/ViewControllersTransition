//
//  DismissAnimator.m
//  ViewControllersTransition
//
//  Created by YouXianMing on 15/7/21.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "DismissAnimator.h"

@implementation DismissAnimator

- (void)animateTransitionEvent {

    // 当前控制器的view
    UIView *currentView = self.fromViewController.view;
    
    // 变化的控制器的view
    UIView *toView   = self.toViewController.view;
    toView.transform = CGAffineTransformMakeScale(0.98, 0.98);
    
    // 执行动画
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.f
         usingSpringWithDamping:1.f
          initialSpringVelocity:0.f
                        options:0
                     animations:^{
                         currentView.y    = Height;
                         toView.transform = CGAffineTransformMakeScale(1.f, 1.f);
                     }
                     completion:^(BOOL finished) {
                         [self completeTransition];
                     }];
}

@end
