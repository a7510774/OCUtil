//
//  OCUtil.h
//  OCUtilDemo
//
//  Created by chengw on 15/8/5.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OCUtil : NSObject

@end

/**
 *  @brief  输入聚焦发光TextField 
    @使用方式 code+xib
 */
@interface InputLightTextField : UITextField
{
    CGFloat _cornerRadio;//圆角半径
    UIColor *_borderColor;//边界颜色
    CGFloat _borderWidth;//边界大小
    UIColor *_lightColor;//焦点时阴影颜色
    CGFloat _lightSize;//焦点时阴影大小
    UIColor *_lightBorderColor;//焦点时边界颜色
}
- (id)initWithFrame:(CGRect)frame
        cornerRadio:(CGFloat)radio
        borderColor:(UIColor*)bColor
        borderWidth:(CGFloat)bWidth
         lightColor:(UIColor*)lColor
          lightSize:(CGFloat)lSize
   lightBorderColor:(UIColor*)lbColor;
@end

/**
 *  控制TextField的缩进量
 */
@interface JMTextField : UITextField

@end

