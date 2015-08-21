//
//  JYTextField.h
//  meetingManager
//
//  Created by kinglate on 13-1-22.
//  Copyright (c) 2013年 joyame. All rights reserved.
//

/**
 *  @brief  UITextField 输入发光
 *  @使用说明 xib中直接替换 代码创建需要自定参数
 */

#import <UIKit/UIKit.h>

@interface FocusTextField : UITextField
{
	CGFloat _cornerRadio;//圆角半径
	UIColor *_borderColor;//边界颜色
	CGFloat _borderWidth;//边界大小
	UIColor *_lightColor;//焦点时阴影颜色
	CGFloat _lightSize;//焦点时阴影大小
	UIColor *_lightBorderColor;//焦点时边界颜色
}
//代码方式，需要自定参数
- (id)initWithFrame:(CGRect)frame
		cornerRadio:(CGFloat)radio
		borderColor:(UIColor*)bColor
		borderWidth:(CGFloat)bWidth
		 lightColor:(UIColor*)lColor
		  lightSize:(CGFloat)lSize
   lightBorderColor:(UIColor*)lbColor;
@end
