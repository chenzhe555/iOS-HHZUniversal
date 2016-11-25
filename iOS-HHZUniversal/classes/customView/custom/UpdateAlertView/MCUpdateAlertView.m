//
//  MCAlertView.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCUpdateAlertView.h"
#import "HHZLabel.h"
#import "HHZKitTool.h"
#import "UIView+HHZCategory.h"
#import "HHZMACROConfig.h"
#import "UIImage+HHZCategory.h"

#define kMCAlertViewLeftSpace 30.0f
@interface MCUpdateAlertView ()

@property (nonatomic, assign) CGFloat leftWidth;

@property (nonatomic, assign) CGFloat bgViewWidth;

@end

@implementation MCUpdateAlertView

-(void)initWithTitle:(NSString *)title andMessage:(NSString *)message andDelegate:(id<MCUpdateAlertViewDelegate>)delegate andButtonTitles:(NSArray *)buttonArray
{
    self.alpha = 0.0f;
    _delegate = delegate;
    
    if (kIS_iPhone6Plus)
    {
        _leftWidth = 55;
        _bgViewWidth = [UIScreen mainScreen].bounds.size.width - _leftWidth*2;
    }
    else if (kIS_iPhone6)
    {
        _leftWidth = 45;
        _bgViewWidth = [UIScreen mainScreen].bounds.size.width - _leftWidth*2;
    }
    else
    {
        _leftWidth = 30;
        _bgViewWidth = [UIScreen mainScreen].bounds.size.width - _leftWidth*2;
    }
    
    //标题和文本Label
    HHZLabel * titleLabel = [[HHZLabel alloc] init];
    titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    HHZLabel * messageLabel = [[HHZLabel alloc] init];
    messageLabel.font = [UIFont systemFontOfSize:14.0f];
    
    UIView * bgView = [[UIView alloc] init];
    
    if (title.length > 0)
    {
        titleLabel.limitWidth = _bgViewWidth - 30*2;
        titleLabel.numberOfLines = 0;
        titleLabel.text = title;
        titleLabel.frame = CGRectMake((_bgViewWidth - titleLabel.width - 5)/2, 20, titleLabel.width + 5    , titleLabel.height);
    }
    else
    {
        titleLabel.frame = CGRectMake(kMCAlertViewLeftSpace, 10, _bgViewWidth - 30*2, 0);
    }
    
    if (message.length > 0)
    {
        messageLabel.limitWidth = _bgViewWidth - 30*2;
        messageLabel.numberOfLines = 0;
        messageLabel.text = message;
        messageLabel.frame = CGRectMake(kMCAlertViewLeftSpace, titleLabel.y + titleLabel.height + 10, messageLabel.width, messageLabel.height);
    }
    else
    {
        messageLabel.frame = CGRectMake(kMCAlertViewLeftSpace, titleLabel.y + titleLabel.height + 10, messageLabel.width,0);
    }
    
    //横线
    UIView * hengView = [[UIView alloc] init];
    hengView.backgroundColor = [UIColor lightGrayColor];
    hengView.frame = CGRectMake(0, messageLabel.y + messageLabel.height + 10 - 0.5, _bgViewWidth, 0.5);
    [bgView addSubview:hengView];
    
    //按钮
    for (int i = 0; i < buttonArray.count; i++)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:buttonArray[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(i*(_bgViewWidth/buttonArray.count), messageLabel.y + messageLabel.height + 10, _bgViewWidth/buttonArray.count, 40);
        [button setTitleColor:[UIColor colorWithRed:0.0353 green:0.4980 blue:1.0f alpha:1.0f] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage transformToPureImageWithColor_hhz:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage transformToPureImageWithColor_hhz:[UIColor lightGrayColor]] forState:UIControlStateHighlighted];
        button.tag = i;
        [button addTarget:self action:@selector(AlertViewButtonClikced:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:button];
    }
    
    //竖线
    for (int i = 0; i < buttonArray.count - 1; i++)
    {
        UIView * vie = [[UIView alloc] init];
        vie.backgroundColor = [UIColor lightGrayColor];
        vie.frame = CGRectMake(_bgViewWidth/buttonArray.count, messageLabel.y + messageLabel.height + 10, 0.5, 40);
        [bgView addSubview:vie];
    }
    
    
    bgView.layer.cornerRadius = 10.0f;
    bgView.layer.masksToBounds = YES;
    bgView.backgroundColor = [UIColor whiteColor];
    
    [bgView addSubview:titleLabel];
    [bgView addSubview:messageLabel];
    [self addSubview:bgView];
    //    self.backgroundColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.8];
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.8];
    
    CGFloat bgViewHeight = messageLabel.y + messageLabel.height + 40 + 10;
    
    bgView.frame = CGRectMake(_leftWidth, (SCREENH - bgViewHeight)/2, _bgViewWidth, bgViewHeight);
    [self addSubview:bgView];
    self.frame = [UIScreen mainScreen].bounds;
    [[HHZKitTool getMainWindow] addSubview:self];
    
    [UIView animateWithDuration:0.5f animations:^{
        self.alpha = 1.0f;
    }];
}

-(void)AlertViewButtonClikced:(UIButton *)btn
{
    [UIView animateWithDuration:0.5f animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
        
        if (_delegate && [_delegate respondsToSelector:@selector(dlClickedMCAlertView:andClickedIndex:)])
        {
            [_delegate dlClickedMCAlertView:self andClickedIndex:btn.tag];
        }
    }];
    
    
}

@end
