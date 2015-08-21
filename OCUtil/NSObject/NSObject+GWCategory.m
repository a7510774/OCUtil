//
//  NSObject+Util.m
//  OCUtilDemo
//
//  Created by chengw on 15/8/5.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import "NSObject+GWCategory.h"
#import "UIImage+GWCategory.h"

/** 尺寸 **/
#define kScreenH  [[UIScreen mainScreen] bounds].size.height
#define kScreenW  [[UIScreen mainScreen] bounds].size.width

@implementation NSObject (GWCategory)

@end

@implementation NSObject (CreateView)
- (UIView *)createButtonWithTitle:(NSString *)title tag:(NSInteger)tag
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat kmargin = 5;
    btn.frame = CGRectMake(kmargin, kmargin, kScreenW - 2*kmargin, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor colorWithWhite:0.702 alpha:1.000] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor] bounds:btn.bounds] forState:UIControlStateNormal];
    btn.tag = tag;
    [btn addTarget:self action:@selector(UIButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 3.0f;
    btn.layer.masksToBounds = YES;
    [view addSubview:btn];
    
    return view;
}
//overwrite
- (void)UIButtonClick:(UIButton *)sender
{
    
}

@end

