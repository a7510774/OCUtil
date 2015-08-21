//
//  UIButton+GWCategory.h
//  OCUtilDemo
//
//  Created by chengw on 15/8/21.
//  Copyright (c) 2015年 JM. All rights reserved.
/*
 1、按钮及图片对齐
 
 */

#import <UIKit/UIKit.h>

@interface UIButton (GWCategory)

@end

/**
 *  @brief  设置UIButton 文字以及图片的对齐方式
 */

@interface UIButton (Align)

/**
 *  @brief  上图下字(推荐)
 */
- (void)titleBottom;

/**
 *  @brief  左字右图
 */
- (void)titleLeft;

/**
 *  @brief  左图右字(默认)
 */
- (void)titleDefault;

/**
 *  @brief  两者居中
 */
- (void)centerButtonAndImage;

@end