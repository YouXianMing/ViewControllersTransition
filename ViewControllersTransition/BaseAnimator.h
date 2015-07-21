//
//  BaseAnimator.h
//  ViewControllersTransition
//
//  Created by YouXianMing on 15/7/21.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  动画执行时间(默认值为0.5s)
 */
@property (nonatomic) NSTimeInterval  transitionDuration;

/**
 *  == 子类重写此方法实现动画效果 ==
 *
 *  动画事件
 */
- (void)animateTransitionEvent;

/**
 *  == 在animateTransitionEvent使用才有效 ==
 *
 *  源头控制器
 */
@property (nonatomic, readonly, weak) UIViewController *fromViewController;

/**
 *  == 在animateTransitionEvent使用才有效 ==
 *
 *  目标控制器
 */
@property (nonatomic, readonly, weak) UIViewController *toViewController;

/**
 *  == 在animateTransitionEvent使用才有效 ==
 *
 *  containerView
 */
@property (nonatomic, readonly, weak) UIView           *containerView;

/**
 *  动画事件结束
 */
- (void)completeTransition;

@end
