//
//  HHZTopShowAlertView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 2017/1/12.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZTopShowAlertView.h"
#import "HHZLabel.h"
#import "HHZMACROConfig.h"
#import "UIView+HHZCategory.h"
#import "HHZKitTool.h"
#import "HHZWeakProxy.h"

#define HHZTopShowAlertView_Height 84


@interface HHZTopShowAlertView ()<CAAnimationDelegate>
/**
 *  动画组
 */
@property (nonatomic,copy)  CAAnimationGroup * animationGroup;
/**
 *  顶部试图
 */
@property (nonatomic, strong) UIView * topView;
@property (nonatomic, strong) HHZLabel * topLabel;
/**
 *  底部视图
 */
@property (nonatomic, strong) UIView * bottomView;
@property (nonatomic, strong) HHZLabel * bottomLabel;
@end

@implementation HHZTopShowAlertView
+(instancetype)shareManager
{
    static HHZTopShowAlertView * alertView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertView = [[HHZTopShowAlertView alloc] init];
        alertView.frame = CGRectMake(0, -HHZTopShowAlertView_Height, SCREENW, HHZTopShowAlertView_Height);
        [alertView generateBGView];
        [alertView generateAnimation];
        [[HHZKitTool getMainWindow] insertSubview:alertView atIndex:(INT_MAX - 1000)];
    });
    return alertView;
}

//获取左右间隙
-(CGFloat)getSpace
{
    if (kIS_iPhone4) {
        return 12;
    }
    else if (kIS_iPhone5) {
        return 12;
    }
    else if (kIS_iPhone6) {
        return 15;
    }
    else if (kIS_iPhone6Plus) {
        return 20;
    }
    else {
        return 23;
    }
}

//生成背景视图
-(void)generateBGView
{
    CGFloat space = [self getSpace];
    
    //生成背景图
    self.bgView = [[UIView alloc] init];
    self.bgView.frame = CGRectMake(space, 10, SCREENW - 2*space, self.height - 10);
    self.bgView.layer.cornerRadius = 6.0f;
    self.bgView.layer.masksToBounds = YES;
    
    //获取背景顶部视图
    self.topView = [[UIView alloc] init];
    self.topView.frame = CGRectMake(0, 0, self.bgView.width, 26);
    self.topView.backgroundColor = [UIColor lightGrayColor];
    
    self.topLabel = [[HHZLabel alloc] init];
    self.topLabel.limitWidth = self.topView.width - 20;
    self.topLabel.textAlignment = NSTextAlignmentLeft;
    self.topLabel.frame = CGRectMake(10, 2, 0, 0);
    [self.topView addSubview:self.topLabel];
    
    
    //获取背景底部视图
    self.bottomView = [[UIView alloc] init];
    self.bottomView.frame = CGRectMake(0, self.topView.y + self.topView.height, self.topView.width, self.bgView.height - self.topView.height);
    self.bottomView.backgroundColor = kMCColor(250, 250, 250, 1);
    
    self.bottomLabel = [[HHZLabel alloc] init];
    self.bottomLabel.numberOfLines = 0;
    self.bottomLabel.font = [UIFont systemFontOfSize:17];
    self.bottomLabel.limitWidth = self.bottomView.width - 20;
    self.bottomLabel.textAlignment = NSTextAlignmentLeft;
    self.bottomLabel.frame = CGRectMake(10, 5, 0, 0);
    [self.bottomView addSubview:self.bottomLabel];
    
    
    [self.bgView addSubview:self.topView];
    [self.bgView addSubview:self.bottomView];
    [self addSubview:self.bgView];
}

//生成动画对象
-(void)generateAnimation
{    
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation1.fromValue = @(self.frame.origin.y - HHZTopShowAlertView_Height/2.0);
    animation1.toValue = @(self.frame.origin.y + HHZTopShowAlertView_Height*3/2.0);
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation1.duration = 0.6;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.toValue = @(0);
    animation2.fromValue = @(1.0);
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation2.beginTime = 1.4;
    animation2.duration = 0.6;
    
    
    self.animationGroup = [CAAnimationGroup animation];
    self.animationGroup.delegate = (id)[HHZWeakProxy proxyWithTarget_hhz:self];
    self.animationGroup.animations = [NSArray arrayWithObjects:animation1,animation2, nil];
    self.animationGroup.duration = 2;
}

-(void)showAlertViewWithTitle:(NSString *)title Content:(NSString *)content Type:(HHZTopShowAlertViewType)type
{
    if (self.isFinished) {
        [self fillTextWithTitle:title Content:content Type:type];
        [self.layer addAnimation:self.animationGroup forKey:nil];
    }
    else {
        [self.dataArray addObject:@[title?title:@"",content?content:@"",@(type)]];
    }
    
}

-(void)fillTextWithTitle:(NSString *)title Content:(NSString *)content Type:(HHZTopShowAlertViewType)type
{
    if (!title) title = @"";
    if (!content) content = @"";
    
    self.topLabel.text = title;
    self.topLabel.frame = CGRectMake(self.topLabel.x, (self.topView.height - self.topLabel.height)/2.0, self.topLabel.width, self.topLabel.height);
    
    self.bottomLabel.text = content;
    self.bottomLabel.frame = CGRectMake(self.bottomLabel.x, (self.bottomView.height - self.bottomLabel.height)/2.0, self.bottomLabel.width, self.bottomLabel.height);
}


#pragma mark 改变颜色
-(void)changeTopColor:(UIColor *)color
{
    self.topView.backgroundColor = color;
}

-(void)changeBottomColor:(UIColor *)color
{
    self.bottomView.backgroundColor = color;
}


#pragma mark CAAnimationDelegate 回调事件
-(void)animationDidStart:(CAAnimation *)anim
{
    self.isFinished = NO;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.isFinished = YES;
    
    if (self.dataArray.count != 0) {
        NSArray * arr = self.dataArray[0];
        [self showAlertViewWithTitle:arr[0] Content:arr[1] Type:[arr[2] integerValue]];
        [self.dataArray removeObjectAtIndex:0];
    }
}
@end
