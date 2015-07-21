//
//  ThirdViewController.m
//  ViewControllersTransition
//
//  Created by YouXianMing on 15/7/21.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ThirdViewController.h"
#import "GlobalValue.h"
#import "UIButton+inits.h"
#import "UIView+GlowView.h"

@interface ThirdViewController ()

@property (nonatomic, strong) UILabel *downLabel;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self createView];
    
    [self createButton];
}

/**
 *  创建view
 */
- (void)createView {
    
    UIView *whiteView         = [[UIView alloc] initWithFrame:CGRectMake(0, Height / 2.f, Width, Height / 2.f)];
    whiteView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.75f];
    [self.view addSubview:whiteView];
    
    self.downLabel      = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Width, Height / 2.f)];
    self.downLabel.textAlignment = NSTextAlignmentCenter;
    self.downLabel.text          = @"YouXianMing";
    self.downLabel.font          = [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:36.f];
    self.downLabel.textColor     = [UIColor whiteColor];
    [whiteView addSubview:self.downLabel];
    
    self.downLabel.glowRadius        = @(5.f);
    self.downLabel.glowOpacity       = @(0.8);
    self.downLabel.glowColor         = [UIColor cyanColor];
    
    self.downLabel.glowDuration          = @(0.5f);
    self.downLabel.hideDuration          = @(1.f);
    self.downLabel.glowAnimationDuration = @(0.5f);
    
    [self.downLabel createGlowLayer];
    [self.downLabel insertGlowLayer];
    
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    [self.downLabel startGlowLoop];
}

/**
 *  创建按钮
 */
- (void)createButton {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, Height / 2.f, Width, Height / 2.f)];
    [self.view addSubview:button];
    
    [button addTarget:self
               action:@selector(buttonsEvent:)
     forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonsEvent:(UIButton *)button {

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
