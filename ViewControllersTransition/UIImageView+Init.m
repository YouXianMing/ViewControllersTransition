//
//  UIImageView+Init.m
//  ViewControllersTransition
//
//  Created by YouXianMing on 15/7/21.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "UIImageView+Init.h"

@implementation UIImageView (Init)

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image {

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image        = image;
    
    return imageView;
}

@end
