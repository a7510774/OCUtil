//
//  UIButton+GWCategory.m
//  OCUtilDemo
//
//  Created by chengw on 15/8/21.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import "UIButton+GWCategory.h"

@implementation UIButton (GWCategory)

@end

@implementation UIButton (Align)

- (void)titleBottom:(float)spacing
{
    // get the size of the elements here for readability
    // http://my.oschina.net/sayonala/blog/198376
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // get the height they will take up as a unit
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0);
}

- (void)titleBottom
{
    const int DEFAULT_SPACING = 6.0f;
    [self titleBottom:DEFAULT_SPACING];
}

#pragma mark - 左图右字(默认) -
- (void)titleDefault
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
}

#pragma mark - 左字右图 -
- (void)titleLeft:(float)space
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -(imageSize.width * 2), 0.0, 0.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, -(titleSize.width * 2 + space));
}

- (void)titleLeft
{
    const int DEFAULT_SPACING = 0.0f;
    [self titleLeft:DEFAULT_SPACING];
}

#pragma mark - 两者居中 -
- (void)centerButtonAndImage
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -self.imageView.bounds.size.width, 0.0, 0.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, -self.titleLabel.bounds.size.width);
}

@end