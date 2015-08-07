//
//  NSObject+Util.m
//  OCUtilDemo
//
//  Created by chengw on 15/8/5.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import "NSObject+Util.h"

@implementation NSObject (Util)

@end


@implementation UIImage (CreateByColer)

+ (UIImage *)imageWithColor:(UIColor *)color bounds:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end

@implementation NSObject (CreateView)
- (UIView *)createButtonWithTitle:(NSString *)title tag:(NSInteger)tag
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat kmargin = 5;
    btn.frame = CGRectMake(kmargin, kmargin, kScreenW - 2*kmargin, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor colorWithWhite:0.702 alpha:1.000] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor] bounds:btn.bounds] forState:UIControlStateNormal];
    btn.tag = tag;
    [btn addTarget:self action:@selector(UIButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 3.0f;
    btn.layer.masksToBounds = YES;
    [view addSubview:btn];
    
    return view;
}
//overwrite
- (void)UIButtonClick:(UIButton *)sender
{
    
}

@end

@implementation UIButton (textAndimage_Align)


#pragma mark - 上图下字(推荐) -
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

#pragma mark -
@end

@implementation UIView (Util)

#pragma mark - log
- (void)logFrame
{
    NSLog(@"frame:\n x:%f\n y:%f\n width:%f\n height:%f\n",self.frame.origin.x,self.frame.origin.y,self.frame.size.width,self.frame.size.height);
}

- (void)logPoint
{
    NSLog(@"point:\n x:%f\n y:%f\n",self.center.x,self.center.y);
}

#pragma mark - shadow
- (void)showShadow
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 10.0;
}

#pragma mark - mask
- (void)maskWithImageName:(NSString *)name
{
    CALayer *mask_test = [[CALayer alloc]init];
    UIImage *image = [UIImage imageNamed:name];
    CGRect imageF = CGRectMake(0, 0, image.size.width, image.size.height);
    mask_test.contents = (__bridge id)(image.CGImage);
    mask_test.frame = imageF;
    
    self.layer.mask = mask_test;
}
@end

@implementation UIImage(Circle)
- (UIImage*)circleImageWithParam:(CGFloat)inset {
    UIGraphicsBeginImageContext(self.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, self.size.width - inset * 2.0f, self.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [self drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}
@end