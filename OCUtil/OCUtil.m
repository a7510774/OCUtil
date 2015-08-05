//
//  OCUtil.m
//  OCUtilDemo
//
//  Created by chengw on 15/8/5.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import "OCUtil.h"

@implementation OCUtil

@end


@implementation InputLightTextField

//支持xib，并默认参数
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return [self initWithFrame:self.frame
                   cornerRadio:5
                   borderColor:[UIColor colorWithWhite:1 alpha:0.7]
                   borderWidth:2
                    lightColor:[UIColor colorWithRed:0.243 green:0.502 blue:0.843 alpha:1.000]
                     lightSize:8
              lightBorderColor:[UIColor colorWithRed:0.243 green:0.502 blue:0.843 alpha:0.8]];
}

- (id)initWithFrame:(CGRect)frame
        cornerRadio:(CGFloat)radio
        borderColor:(UIColor*)bColor
        borderWidth:(CGFloat)bWidth
         lightColor:(UIColor*)lColor
          lightSize:(CGFloat)lSize
   lightBorderColor:(UIColor*)lbColor
{
    self = [super initWithFrame:frame];
    if (self) {
        _borderColor = bColor;
        _cornerRadio = radio;
        _borderWidth = bWidth;
        _lightColor = lColor;
        _lightSize = lSize;
        _lightBorderColor = lbColor;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEdit:) name:UITextFieldTextDidEndEditingNotification object:self];
        [self.layer setCornerRadius:_cornerRadio];
        [self.layer setBorderColor:_borderColor.CGColor];
        [self.layer setBorderWidth:_borderWidth];
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setMasksToBounds:NO];
    }
    return self;
}

- (void)beginEditing:(NSNotification*) notification
{
    [[self layer] setShadowOffset:CGSizeMake(0, 0)];
    [[self layer] setShadowRadius:_lightSize];
    [[self layer] setShadowOpacity:1];
    [[self layer] setShadowColor:_lightColor.CGColor];
    [self.layer setBorderColor:_lightBorderColor.CGColor];
}

- (void)endEdit:(NSNotification*) notification
{
    [[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowRadius:0];
    [[self layer] setShadowOpacity:0];
    [[self layer] setShadowColor:nil];
    [self.layer setBorderColor:_borderColor.CGColor];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    
    CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio*2,
                              bounds.origin.y,
                              bounds.size.width - _cornerRadio*2,
                              bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    
    CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio*2,
                              bounds.origin.y,
                              bounds.size.width - _cornerRadio*2,
                              bounds.size.height);
    return inset;
}
@end

@implementation JMTextField


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