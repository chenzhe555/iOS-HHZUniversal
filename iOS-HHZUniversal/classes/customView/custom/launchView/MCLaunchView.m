//
//  MCLaunchView.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 15/11/16.
//  Copyright © 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "MCLaunchView.h"
#import "HHZPathTool.h"
#import "HHZKitTool.h"
#import "UIView+HHZCategory.h"
#import "HHZMACROConfig.h"
#import <SDWebImage/SDWebImageManager.h>


#define kMCLaunchViewImgURL @"kMCLaunchViewImgURL1"         //图片存储位置
#define kMCLaunchViewImgNSStringURL @"kMCLaunchViewImgNSStringURL1"         //图片网络地址


@interface MCLaunchView ()
/**
 *  显示网络图片
 */
@property (nonatomic, strong) UIImageView * launchView;
/**
 *  关闭按钮
 */
@property (nonatomic, strong) UIButton * closeBtn;

/**
 *  显示时间
 */
@property (nonatomic, assign) CGFloat time;

/**
 *  最大显示时间
 */
@property (nonatomic, assign) CGFloat MaxTime;

@property (nonatomic, strong) NSTimer * timer;

@end

@implementation MCLaunchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        
        _launchView = [[UIImageView alloc] init];
        _launchView.frame = self.bounds;
        [self addSubview:_launchView];
        
        
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _closeBtn.frame = CGRectMake(self.width - 60, 30, 40, 40);
        _closeBtn.backgroundColor = [UIColor lightGrayColor];
        _closeBtn.alpha = 0.8;
        _closeBtn.layer.cornerRadius = 20;
        _closeBtn.layer.masksToBounds = YES;
        [_closeBtn setTitle:@"跳过" forState:UIControlStateNormal];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_closeBtn addTarget:self action:@selector(closeLocloseLaunchView) forControlEvents:UIControlEventTouchUpInside];
        [_closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:_closeBtn];
        
        _MaxTime = 1;
        
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLaunchImageView)]];
    }
    return self;
}


//点击Launch事件
-(void)tapLaunchImageView
{
    if (_delegate && [_delegate respondsToSelector:@selector(dlLaunchViewTap)])
    {
        [self closeImmediately];
        [_delegate dlLaunchViewTap];
    }
}

-(void)setImageShowTime:(CGFloat)time
{
    _MaxTime = time;
}

-(void)downLoadImage:(NSString *)imgURL
{
    if (imgURL.length > 0 && !([imgURL isEqualToString:[kUserDef objectForKey:kMCLaunchViewImgNSStringURL]]))
    {
        [[[SDWebImageManager sharedManager] imageDownloader] downloadImageWithURL:[NSURL URLWithString:imgURL] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
        } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
            if (data.length > 0)
            {
                [kUserDef setObject:imgURL forKey:kMCLaunchViewImgNSStringURL];
                [kFileManager removeItemAtPath:[HHZPathTool getDocumentPath:kMCLaunchViewImgURL] error:nil];
                [data writeToFile:[HHZPathTool getDocumentPath:kMCLaunchViewImgURL] atomically:YES];
            }
        }];
    }
    
}


-(void)showLaunchViewWithDelegate:(id<MCLaunchViewDelegate>)delegate
{
    _delegate = delegate;
    
//    UIImage *img = [UIImage imageNamed:@"img_mainload_bg"];
//    _launchView.image = img;
//    [[MCKitTool getMainWindow] addSubview:self];
//    _time = 0;
//        
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showLaunchAnimation) userInfo:nil repeats:YES];
    
    
    
    UIImage * img = [UIImage imageWithContentsOfFile:[HHZPathTool getDocumentPath:kMCLaunchViewImgURL]];
    if (!img)
    {
        img = [UIImage imageNamed:@"Test"];
    }

    _launchView.image = img;
    [[HHZKitTool getMainWindow] addSubview:self];
    _time = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showLaunchAnimation) userInfo:nil repeats:YES];
}

//显示launch动画
-(void)showLaunchAnimation
{
    _time += 0.5;
    if (_time > _MaxTime)
    {
        [self.timer invalidate];
        self.timer = nil;
        [self closeLocloseLaunchView];
    }
}

-(void)closeImmediately
{
    [kNotification removeObserver:self];
    _launchView = nil;
    _closeBtn = nil;
    [self removeFromSuperview];
}

/** 正常关闭launch */
- (void)closeLocloseLaunchView{
    [kNotification removeObserver:self];
    [self hideWithAnimate];
}

// 通知关闭launch
-(void)closeLaunchView_Notification
{
    [self closeLocloseLaunchView];
}

-(void)hideWithAnimate
{
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    self.layer.anchorPoint = CGPointMake(0.5, 0.5);
    animation1.fromValue = @1.0f;
    animation1.toValue = @1.5f;
    
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.fromValue = @1.0f;
    animation2.toValue = @0.0f;
    
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = @[animation1,animation2];
    group.delegate = self;
    group.duration = 0.5f;
    
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:group forKey:@"scale"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.layer removeAllAnimations];
    _launchView = nil;
    _closeBtn = nil;
    [self removeFromSuperview];
}

@end
