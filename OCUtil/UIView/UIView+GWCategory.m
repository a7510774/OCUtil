//
//  UIView+GWCategory.m
//  OCUtilDemo
//
//  Created by chengw on 15/8/21.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import "UIView+GWCategory.h"

@implementation UIView (GWCategory)

@end

#define SCREEN_SCALE  ([[UIScreen mainScreen] scale])
#define PIXEL_INTEGRAL(pointValue)      (round(pointValue * SCREEN_SCALE) / SCREEN_SCALE)
@implementation UIView (Positioning)

// Setters
-(void)setX:(CGFloat)x{
    self.frame      = CGRectMake(PIXEL_INTEGRAL(x), self.y, self.width, self.height);
}

-(void)setY:(CGFloat)y{
    self.frame      = CGRectMake(self.x, PIXEL_INTEGRAL(y), self.width, self.height);
}

-(void)setWidth:(CGFloat)width{
    self.frame      = CGRectMake(self.x, self.y, PIXEL_INTEGRAL(width), self.height);
}

-(void)setHeight:(CGFloat)height{
    self.frame      = CGRectMake(self.x, self.y, self.width, PIXEL_INTEGRAL(height));
}

-(void)setOrigin:(CGPoint)origin{
    self.x          = origin.x;
    self.y          = origin.y;
}

-(void)setSize:(CGSize)size{
    self.width      = size.width;
    self.height     = size.height;
}

-(void)setRight:(CGFloat)right {
    self.x          = right - self.width;
}

-(void)setBottom:(CGFloat)bottom {
    self.y          = bottom - self.height;
}

-(void)setLeft:(CGFloat)left{
    self.x          = left;
}

-(void)setTop:(CGFloat)top{
    self.y          = top;
}

-(void)setCenterX:(CGFloat)centerX {
    self.center     = CGPointMake(PIXEL_INTEGRAL(centerX), self.center.y);
}

-(void)setCenterY:(CGFloat)centerY {
    self.center     = CGPointMake(self.center.x, PIXEL_INTEGRAL(centerY));
}

-(void)setBoundsX:(CGFloat)boundsX{
    self.bounds     = CGRectMake(PIXEL_INTEGRAL(boundsX), self.boundsY, self.boundsWidth, self.boundsHeight);
}

-(void)setBoundsY:(CGFloat)boundsY{
    self.bounds     = CGRectMake(self.boundsX, PIXEL_INTEGRAL(boundsY), self.boundsWidth, self.boundsHeight);
}

-(void)setBoundsWidth:(CGFloat)boundsWidth{
    self.bounds     = CGRectMake(self.boundsX, self.boundsY, PIXEL_INTEGRAL(boundsWidth), self.boundsHeight);
}

-(void)setBoundsHeight:(CGFloat)boundsHeight{
    self.bounds     = CGRectMake(self.boundsX, self.boundsY, self.boundsWidth, PIXEL_INTEGRAL(boundsHeight));
}

// Getters
-(CGFloat)x{
    return self.frame.origin.x;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGPoint)origin{
    return CGPointMake(self.x, self.y);
}

-(CGSize)size{
    return CGSizeMake(self.width, self.height);
}

-(CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)left{
    return self.x;
}

-(CGFloat)top{
    return self.y;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(CGFloat)centerY {
    return self.center.y;
}

-(UIView *)lastSubviewOnX{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.x > outView.x)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

-(UIView *)lastSubviewOnY{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];
        
        for(UIView *v in self.subviews)
            if(v.y > outView.y)
                outView = v;
        
        return outView;
    }
    
    return nil;
}

-(CGFloat)boundsX{
    return self.bounds.origin.x;
}

-(CGFloat)boundsY{
    return self.bounds.origin.y;
}

-(CGFloat)boundsWidth{
    return self.bounds.size.width;
}

-(CGFloat)boundsHeight{
    return self.bounds.size.height;
}

// Methods
-(void)centerToParent{
    if(self.superview){
        switch ([UIApplication sharedApplication].statusBarOrientation){
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:{
                self.origin     = CGPointMake((self.superview.height / 2.0) - (self.width / 2.0),
                                              (self.superview.width / 2.0) - (self.height / 2.0));
                break;
            }
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationPortraitUpsideDown:{
                self.origin     = CGPointMake((self.superview.width / 2.0) - (self.width / 2.0),
                                              (self.superview.height / 2.0) - (self.height / 2.0));
                break;
            }
            case UIInterfaceOrientationUnknown:
                return;
        }
    }
}

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