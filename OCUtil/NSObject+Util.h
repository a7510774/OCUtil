//
//  NSObject+Util.h
//  OCUtilDemo
//
//  Created by chengw on 15/8/5.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** 尺寸 **/
#define kScreenH  [[UIScreen mainScreen] bounds].size.height
#define kScreenW  [[UIScreen mainScreen] bounds].size.width

@interface NSObject (Util)


@end

/**
 *  @brief  根据颜色创建图片
 */
@interface UIImage (CreateByColer)

//根据颜色创建图片
+ (UIImage *)imageWithColor:(UIColor *)color bounds:(CGRect)rect;
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

/**
 *  @brief  设置UIButton 文字以及图片的对齐方式
 */
@interface UIButton (textAndimage_Align)

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

/**
 *  @brief  打印frame/打印point/阴影
 */
@interface UIView (Util)

//打印
- (void)logFrame;
- (void)logPoint;

//显示阴影
- (void)showShadow;

//不规则图形
- (void)maskWithImageName:(NSString *)name;

@end



