//
//  MCBottmPopView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCBottmPopView.h"
#import "HHZMACROConfig.h"
#import "UIView+HHZCategory.h"

static const CGFloat buttonHeight = 40.0f;                      //每个button高度
static CGFloat height;                                          //用于标记的button Y

@interface MCBottmPopView()
/**
 *  底部弹出的视图
 */
@property (nonatomic, strong) UIView * popView;
@end

@implementation MCBottmPopView

-(void)showPopViewWithTitleArray:(NSArray *)titleArray andColorArray:(NSArray *)colorArray andDelegate:(id<BasePopViewDelegate>)delegat
{
    [super initTheme];
    
    self.delegate = delegat;
    
    
    _popView = [[UIView alloc] init];
    _popView.backgroundColor = kMCColor(238, 238, 238, 1);
    _popView.frame = CGRectMake(0, 0, self.width, 0);
    
    for (int i = 0; i < titleArray.count; i++)
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5.0f;
        button.layer.masksToBounds = YES;
        button.backgroundColor = [colorArray objectAtIndex:i];
        [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.adjustsImageWhenHighlighted = NO;
        button.frame = CGRectMake(10, 10*2 + i * (buttonHeight + 10*2), self.width - 2 * 10, buttonHeight);
        button.tag = (i + 123);
        [button addTarget:self action:@selector(buttonCliked:) forControlEvents:UIControlEventTouchUpInside];
        [_popView addSubview:button];
        
        height = button.frame.size.height + button.frame.origin.y;
    }
    _popView.frame = CGRectMake(0, self.height, self.width, height + 10*2);
    [self addSubview:_popView];
    
    
    self.hidden = NO;
    [UIView animateWithDuration:0.3f animations:^{
        _popView.frame = CGRectMake(0, self.height - height - 10*2, self.width, height + 10*2);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)buttonCliked:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dlBasePopViewButtonClicked:)])
    {
        [self.delegate performSelector:@selector(dlBasePopViewButtonClicked:) withObject:[NSNumber numberWithInteger:(btn.tag - 123)]];
        [self stopView];
    }
}

-(void)stopView
{
    [UIView animateWithDuration:0.3f animations:^{
        _popView.frame = CGRectMake(0, self.frame.size.height, _popView.frame.size.width, height + 10);
        self.bgView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [super stopView];
    }];
}

@end
