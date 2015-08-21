//
//  TagTextField.m
//  OCUtilDemo
//
//  Created by chengw on 15/8/21.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import "TagTextField.h"

@implementation TagTextField

static CGFloat leftMargin = 10;

// 控制编辑后 Text位置 左右缩 10
- (CGRect)textRectForBounds:(CGRect)bounds
{
    bounds.origin.x += leftMargin;
    
    return bounds;
}
// 控制编辑时 Text位置 左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    bounds.origin.x += leftMargin;
    
    return bounds;
}
@end
