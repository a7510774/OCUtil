//
//  UIImage+GWCategory.h
//  OCUtilDemo
//
//  Created by chengw on 15/8/21.
//  Copyright (c) 2015年 JM. All rights reserved.
/*
 1、颜色创建图片
 2、让方形图片变为圆形
 
 */

#import <UIKit/UIKit.h>

@interface UIImage (GWCategory)

@end

@interface UIImage (CreateByColer)

/**
 *  @brief  根据颜色创建图片
 *
 *  @param color 颜色
 *  @param rect  边界
 */
+ (UIImage *)imageWithColor:(UIColor *)color bounds:(CGRect)rect;

@end

@interface UIImage (Circle)
/**
 *  @brief  将方形图片裁剪为圆形
 */
-(UIImage*)circleImageWithParam:(CGFloat) inset;
@end