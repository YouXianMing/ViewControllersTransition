//
//  SecondViewController.m
//  ViewControllersTransition
//
//  Created by YouXianMing on 15/7/21.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "SecondViewController.h"
#import "GlobalValue.h"
#import "UIButton+inits.h"
#import "RootViewController.h"
#import "PopAnimator.h"
#import "ThirdViewController.h"
#import "PresentAnimator.h"
#import "DismissAnimator.h"

typedef enum : NSUInteger {
    
    BUTTON_POP      = 0x11,
    BUTTON_PRESENT,
    
} EFlag;

@interface SecondViewController () <UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenTransition;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setup];
    
    [self initViews];
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self
                                                                                                                  action:@selector(edgePanGesture:)];
    //设置从什么边界滑入
    edgePanGestureRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePanGestureRecognizer];
}

- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)recognizer {
    //计算手指滑的物理距离（滑了多远，与起始位置无关）
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));//把这个百分比限制在0~1之间
    
    //当手势刚刚开始，我们创建一个 UIPercentDrivenInteractiveTransition 对象
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        self.percentDrivenTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
        
    }else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        //当手慢慢划入时，我们把总体手势划入的进度告诉 UIPercentDrivenInteractiveTransition 对象。
        [self.percentDrivenTransition updateInteractiveTransition:progress];
        
    }else if (recognizer.state == UIGestureRecognizerStateCancelled || recognizer.state == UIGestureRecognizerStateEnded) {
        
        //当手势结束，我们根据用户的手势进度来判断过渡是应该完成还是取消并相应的调用 finishInteractiveTransition 或者 cancelInteractiveTransition 方法.
        if (progress > 0.5) {
            [self.percentDrivenTransition finishInteractiveTransition];
        }else{
            [self.percentDrivenTransition cancelInteractiveTransition];
        }
        
        self.percentDrivenTransition = nil;
    }
    
}

- (void)initViews {
    
    self.imageView = [[UIImageView alloc] initWithFrame:IMAGE_FRAME_BIG
                                                  image:SHOW_IMAGE];
    self.imageView.hidden = YES;
    [self.view addSubview:self.imageView];
    
    // 按钮
    UIButton *pushButton = [UIButton createButtonWithFrame:CGRectMake(Width - 100, Height - 40, 90, 30)
                                                buttonType:BUTTON_RED
                                                     title:@"Pop"
                                                       tag:BUTTON_POP
                                                    target:self
                                                    action:@selector(buttonsEvent:)];
    [self.view addSubview:pushButton];
    
    
    // 按钮
    UIButton *presentButton = [UIButton createButtonWithFrame:CGRectMake(10, Height - 40, 90, 30)
                                                   buttonType:BUTTON_RED
                                                        title:@"Present"
                                                          tag:BUTTON_PRESENT
                                                       target:self
                                                       action:@selector(buttonsEvent:)];
    [self.view addSubview:presentButton];
}

- (void)buttonsEvent:(UIButton *)button {

    if (button.tag == BUTTON_POP) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } else if (button.tag == BUTTON_PRESENT) {
        
        ThirdViewController *thirdViewController  = [ThirdViewController new];
        thirdViewController.transitioningDelegate  = self;
        thirdViewController.modalPresentationStyle = UIModalPresentationCustom;
        [self presentViewController:thirdViewController
                           animated:YES
                         completion:^{
                         }];
    }
}

#pragma mark - 动画代理 (导航栏控制器动画代理)
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    
    if ([toVC isKindOfClass:[RootViewController class]]) {
        PopAnimator *transition = [[PopAnimator alloc] init];
        return transition;
    }else{
        return nil;
    }
}

#pragma mark - 动画代理,针对百分比所使用的动画 (导航栏控制器动画代理)
- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    
    if ([animationController isKindOfClass:[PopAnimator class]]) {
        return self.percentDrivenTransition;
    }else{
        return nil;
    }
}

#pragma mark - 定制转场动画 (Present 与 Dismiss动画代理)
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    // 推出控制器的动画
    return [PresentAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    DismissAnimator *dismissAnimator   = [DismissAnimator new];
    dismissAnimator.transitionDuration = 1.f;
    
    // 退出控制器动画
    return dismissAnimator;
}

#pragma mark -
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.imageView.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    self.imageView.hidden = NO;
    
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.imageView.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
}

@end
