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

#define CIRCELSPACE 2.5
@interface CircelRippleImageView()
{
    NSTimer *timer1;//1秒产生一次波纹
}
@end

@implementation CircelRippleImageView

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