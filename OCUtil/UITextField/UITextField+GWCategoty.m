//
//  UITextField+GWCategoty.m
//  OCUtilDemo
//
//  Created by chengw on 15/8/21.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import "UITextField+GWCategoty.h"

@implementation UITextField (GWCategoty)

- (void)setLeftImage:(UIImage *)image
{
    self.leftView = [[UIImageView alloc]initWithImage:image];
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
