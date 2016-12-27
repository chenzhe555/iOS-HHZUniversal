//
//  HHZBottomPopView.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/12/10.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZBottomPopView.h"
#import "HHZMACROConfig.h"
#import "UIView+HHZCategory.h"

//每个button高度
static const CGFloat buttonHeight = 40.0f;

//用于标记的button Y
static CGFloat height;

@interface HHZBottomPopView()
/**
 *  底部弹出的视图
 */
@property (nonatomic, strong) UIView * popView;
@end


@implementation HHZBottomPopView

-(void)showPopViewWithCancelTitle:(NSString *)cancelTitle andotherTitles:(NSArray *)otherTitles andDelegate:(id<PopViewDelegate>)delegate
{
    //如果都没值,则直接返回
    if (cancelTitle == nil && otherTitles == nil) return;
    NSMutableArray * titleArray = [NSMutableArray array];
    
    if (otherTitles != nil) [titleArray addObjectsFromArray:otherTitles];
    if (cancelTitle != nil) [titleArray addObject:cancelTitle];
    if (titleArray.count == 0) return;
    
    NSMutableArray * colorArray = [NSMutableArray array];
    for (NSInteger i = 0; i < titleArray.count; ++i)
    {
        if (i == (titleArray.count - 1))
        {
            if (cancelTitle != nil) {
                [colorArray addObject:[UIColor redColor]];
                break;
            }
        }
        else
        {
            [colorArray addObject:[UIColor whiteColor]];
        }
    }
    
    [self showPopViewWithTitleArray:titleArray andColorArray:colorArray andDelegate:delegate];
}

-(void)showPopViewWithTitleArray:(NSArray *)titleArray andColorArray:(NSArray *)colorArray andDelegate:(id<PopViewDelegate>)delegate
{
    [super initTheme];
    
    self.delegate = delegate;
    
    
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(dlPopViewButtonClicked:)])
    {
        [self.delegate performSelector:@selector(dlPopViewButtonClicked:) withObject:[NSNumber numberWithInteger:(btn.tag - 123)]];
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
