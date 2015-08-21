//
//  UIView+GWCategory.h
//  OCUtilDemo
//
//  Created by chengw on 15/8/21.
//  Copyright (c) 2015年 JM. All rights reserved.
/*
 1、x,y,size,centerx等属性直接使用
 2、log frame
 3、阴影
 4、遮罩（创建不规则图形）
 
 */

#import <UIKit/UIKit.h>

@interface UIView (GWCategory)

@end

@interface UIView (Positioning)

/** frame 的 X 值 */
@property (nonatomic, assign) CGFloat   x;

/** frame 的 Y 值 */
@property (nonatomic, assign) CGFloat   y;

/** frame 的 Width 值 */
@property (nonatomic, assign) CGFloat   width;

/** frame 的 height 值*/
@property (nonatomic, assign) CGFloat   height;

/** View's origin  */
@property (nonatomic, assign) CGPoint   origin;

/** View's size */
@property (nonatomic, assign) CGSize    size;

/** View最底部的Y值 **/
@property (nonatomic, assign) CGFloat   bottom;

/** View最右边的X值 **/
@property (nonatomic, assign) CGFloat   right;

/** View最左边的X值 **/
@property (nonatomic, assign) CGFloat   left;

/** View最顶端的Y值 **/
@property (nonatomic, assign) CGFloat   top;

/** 中心的X值 **/
@property (nonatomic, assign) CGFloat   centerX;

/** 中心的Y值 **/
@property (nonatomic, assign) CGFloat   centerY;

/** SubView中未端的X值 **/
@property (nonatomic, strong, readonly) UIView *lastSubviewOnX;

/** SubView中最未端的Y值 **/
@property (nonatomic, strong, readonly) UIView *lastSubviewOnY;

/** bounds X 值  **/
@property (nonatomic, assign) CGFloat   boundsX;

/** bounds Y 值 **/
@property (nonatomic, assign) CGFloat   boundsY;

/** bounds width 值 **/
@property (nonatomic, assign) CGFloat   boundsWidth;

/** bounds height 值 **/
@property (nonatomic, assign) CGFloat   boundsHeight;

/**
 如果父视图存在，对父视图剧中
 */
-(void) centerToParent;
@end

/**
 *  @brief  打印frame/打印point/阴影
 */
@interface UIView (Util)

//打印
- (void)logFrame;
- (void)logPoint;

/**
 *  @brief  显示阴影
 */
- (void)showShadow;

//不规则图形（遮罩）
- (void)maskWithImageName:(NSString *)name;

@end
