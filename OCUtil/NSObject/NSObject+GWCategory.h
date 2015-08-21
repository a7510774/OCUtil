//
//  NSObject+Util.h
//  OCUtilDemo
//
//  Created by chengw on 15/8/5.
//  Copyright (c) 2015年 JM. All rights reserved.
/*
 1、代码创建按钮
 
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (GWCategory)

@end

/**
 *  @brief  创建一个自定义圆角按钮 （橙色）
 */
@interface NSObject (CreateView)
/**
 *  创建一个自定义圆角按钮 （橙色）
 *
 *  @param title 显示文字
 *  @param tag   tag区分不同的按钮标志
 *
 *  @return 含一个按钮的UIview
 */
- (UIView *)createButtonWithTitle:(NSString *)title tag:(NSInteger)tag;
/**
 *  处理按钮触发的事件
 *
 *  @param sender UIButton通过tag 来区分不同的按钮事件
 */
- (void)UIButtonClick:(UIButton *)sender;
@end

