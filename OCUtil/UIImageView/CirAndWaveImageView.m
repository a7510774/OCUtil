//
//  CirAndWaveImageView.m
//  OCUtilDemo
//
//  Created by chengw on 15/8/21.
//  Copyright (c) 2015年 JM. All rights reserved.
//

#import "CirAndWaveImageView.h"
#import "UIImage+GWCategory.h"
#define CIRCELSPACE 2.5

@interface CirAndWaveImageView ()
{
    NSTimer *timer1;//1秒产生一次波纹
}
@end

@implementation CirAndWaveImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //变圆
        self.layer.cornerRadius = self.frame.size.height/2;
        self.clipsToBounds = YES;
        self.layer.masksToBounds = NO;
        NSLog(@"%@",self.layer);
        //边框
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 3;
        
        //定时动画
        timer1 = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return [self initWithFrame:self.frame];;
}

- (void)timeAction
{
    //画动画圆
    CGRect pathFrame = CGRectMake(-CGRectGetMidX(self.bounds), -CGRectGetMidY(self.bounds), self.bounds.size.width, self.bounds.size.height);
    CGRect pathFrame2 = CGRectMake(-CGRectGetMidX(self.bounds) +CIRCELSPACE, -CGRectGetMidY(self.bounds) + CIRCELSPACE, self.bounds.size.width - 2*CIRCELSPACE , self.bounds.size.height - 2*CIRCELSPACE);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:pathFrame cornerRadius:self.layer.cornerRadius];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:pathFrame2 cornerRadius:self.layer.cornerRadius];
    CGPoint shapePosition = CGPointMake(self.layer.bounds.size.width/2, self.layer.bounds.size.height/2);
    
    CAShapeLayer *circleShape = [CAShapeLayer layer];
    circleShape.path = path.CGPath;
    circleShape.position = shapePosition;
    circleShape.fillColor = [UIColor clearColor].CGColor;
    circleShape.opacity = 0;
    circleShape.strokeColor = [UIColor whiteColor].CGColor;
    circleShape.lineWidth = 2;
    
    CAShapeLayer *circleShape2 = [CAShapeLayer layer];
    circleShape2.path = path2.CGPath;
    circleShape2.position = shapePosition;
    circleShape2.fillColor = [UIColor clearColor].CGColor;
    circleShape2.opacity = 0;
    circleShape2.strokeColor = [UIColor whiteColor].CGColor;
    circleShape2.lineWidth = 2;
    
    [self.layer addSublayer:circleShape];
    [self.layer addSublayer:circleShape2];
    
    //创建动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.8, 1.8, 1)];
    
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1;
    alphaAnimation.toValue = @0;
    
    CABasicAnimation *wideAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    wideAnimation.toValue = @0;
    
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    animation.animations = @[scaleAnimation, alphaAnimation,wideAnimation];
    animation.duration = 2.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.removedOnCompletion = YES;
    animation.delegate = self;
    [circleShape addAnimation:animation forKey:nil];
    [circleShape2 addAnimation:animation forKey:nil];
    NSLog(@"layer.sublayers.count%lu",(unsigned long)self.layer.sublayers.count);
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.layer.sublayers[0] removeFromSuperlayer];
}
- (void)dealloc
{
    [timer1 invalidate];
}
- (void)setImage:(UIImage *)image
{
    [super setImage:[image circleImageWithParam:0]];
}

@end
