//
//  MCBlurItemView.m
//  XiaoMei
//
//  Created by mc962 on 16/8/3.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCBlurItemView.h"
#import "UIView+HHZCategory.h"
#import "HHZMACROConfig.h"

@interface MCBlurItemView()
@property (nonatomic, strong) UIImageView * bgImageView;
@property (nonatomic, strong) UILabel * textLabel;
@end

@implementation MCBlurItemView

+(instancetype)createWithImage:(UIImage *)img BGColor:(UIColor *)color Title:(NSString *)title
{
    MCBlurItemView * blurImageView = [MCBlurItemView new];
    CGFloat wh = [self getItemWH];
    blurImageView.frame = CGRectMake(0, 0, wh, wh + 20);
    return blurImageView;
}

-(void)createImageView:(UIColor *)color Image:(UIImage *)img
{
    UIView * vie = [[UIView alloc] init];
    vie.backgroundColor = color;
    vie.frame = CGRectMake(0, 0, self.width, self.height - 20);
    vie.layer.cornerRadius = vie.width/2.0;
    vie.layer.masksToBounds = YES;
    vie.userInteractionEnabled = YES;
    [self addSubview:vie];
    
    //创建居中图片
    self.bgImageView = [[UIImageView alloc] init];
    self.bgImageView.image = img;
    self.bgImageView.frame = CGRectMake((vie.width - img.size.width)/2, (vie.height - img.size.height)/2, img.size.width, img.size.height);
    [self addSubview:self.bgImageView];
}


-(void)cretaeExtraLabel:(NSString *)text
{
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.frame = CGRectMake(0, self.height - 15, self.width, 12);
    self.textLabel.textColor = [UIColor grayColor];
    self.textLabel.font = [UIFont systemFontOfSize:12.0f];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.text = text;
    [self addSubview:self.textLabel];
}

+(instancetype)createWithImage:(UIImage *)img Title:(NSString *)title BackGroundColor:(UIColor *)color
{
    MCBlurItemView * blurImageView = [self createWithImage:img BGColor:color Title:title];
    [blurImageView createImageView:color Image:img];
    [blurImageView cretaeExtraLabel:title];
    return blurImageView;
}

/**
 *  根据屏幕获取Item不同宽高
 *
 *  @return 
 */
+(CGFloat)getItemWH
{
    if (kIS_iPhone4) {
        return 65;
    }
    else if(kIS_iPhone5) {
        return 65;
    }
    else if (kIS_iPhone6) {
        return 75;
    }
    return 80;
    
}

/**
 *  关键帧动画
 *
 *  @param yOffSet 偏移量
 */
-(void)AnimateWithYOffSet:(CGFloat)yOffSet
{
    CGFloat originY = self.y + self.width/2;
    CGFloat originX = self.x + self.width/2;
    CAKeyframeAnimation * keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrame.values = @[
                        [self getValueX:originX Y:originY],
                        [self getValueX:originX Y:(originY - yOffSet)],
                        [self getValueX:originX Y:(originY - yOffSet + 50)],
                        [self getValueX:originX Y:(originY - yOffSet + 20)],
                        [self getValueX:originX Y:(originY - yOffSet)]
                        ];
    keyFrame.keyTimes = @[@(0.0), @(0.6), @(0.75), @(0.9), @(1)];
    keyFrame.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyFrame.duration = 0.3;
    keyFrame.repeatCount = 1;
    keyFrame.removedOnCompletion = NO;
    keyFrame.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:keyFrame forKey:nil];
    
    self.layer.frame = CGRectMake(self.x, self.y - yOffSet, self.width, self.height);
}

-(NSValue *)getValueX:(CGFloat)x Y:(CGFloat)y
{
    return [NSValue valueWithCGPoint:CGPointMake(x, y)];
}
@end
