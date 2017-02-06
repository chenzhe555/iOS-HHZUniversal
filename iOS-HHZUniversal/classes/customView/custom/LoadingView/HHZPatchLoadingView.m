//
//  HHZPatchLoadingView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/8.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZPatchLoadingView.h"
#import "HHZLabel.h"
#import "UIView+HHZCategory.h"

//MCActivityView宽高(带文字)
static CGFloat kMCActivityViewBGWidth;
static CGFloat kMCActivityViewBGHeight;

//MCActivityView宽高(不带文字)
static CGFloat kMCActivityViewNoTextBGWidth;
static CGFloat kMCActivityViewNoTextBGHeight;

//文字距bgView左右间隙
static CGFloat kMCActivityViewLeftSpace;


@interface HHZPatchLoadingView()
/**
 *  放置控件的View
 */
@property (nonatomic, strong) UIView * bgView;
/**
 *  显示的文本
 */
@property (nonatomic, strong) HHZLabel * contentLabel;

/**
 *  菊花转
 */
@property (nonatomic, strong) UIActivityIndicatorView * activity;
@end

@implementation HHZPatchLoadingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initFrameParameters];
        
        _contentLabel = [[HHZLabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.limitWidth = kMCActivityViewBGWidth - kMCActivityViewLeftSpace*2;
        _contentLabel.font = [UIFont systemFontOfSize:14.0f];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor whiteColor];
        [self.bgView addSubview:_contentLabel];
        
        _activity = [[UIActivityIndicatorView alloc] init];
        _activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [self.bgView addSubview:_activity];
        
    }
    return self;
}


-(void)initFrameParameters
{
    kMCActivityViewBGWidth = 120.0f;
    kMCActivityViewBGHeight = 120.0f;
    kMCActivityViewNoTextBGWidth = 70.0f;
    kMCActivityViewNoTextBGHeight = 70.0f;
    kMCActivityViewLeftSpace = 6.0f;
}

+(instancetype)createPatchLoadingView:(CGRect)frame parentView:(UIView *)parentView
{
    HHZPatchLoadingView * patchView = [[HHZPatchLoadingView alloc] init];
    patchView.frame = frame;
    [parentView addSubview:patchView];
    return patchView;
}

-(void)startShowWithText:(NSString *)showText
{
    _contentLabel.text = showText;
    if (showText == nil)
    {
        self.bgView.frame = CGRectMake((self.width - kMCActivityViewNoTextBGWidth)/2, (self.height - kMCActivityViewNoTextBGHeight)/2, kMCActivityViewNoTextBGWidth, kMCActivityViewNoTextBGHeight);
        _activity.center = CGPointMake(self.bgView.width/2, self.bgView.height/2);
        _contentLabel.hidden = YES;
    }
    else
    {
        self.bgView.frame = CGRectMake((self.width - kMCActivityViewBGWidth)/2, (self.height - kMCActivityViewBGHeight)/2, kMCActivityViewBGWidth, kMCActivityViewBGHeight);
        _activity.center = CGPointMake(self.bgView.width/2, self.bgView.height/2 - 15);
        _contentLabel.hidden = NO;
        _contentLabel.frame = CGRectMake((self.bgView.width - _contentLabel.width)/2, self.bgView.height - _contentLabel.height - 15, _contentLabel.width, _contentLabel.height);
    }
    self.hidden = NO;
    [_activity startAnimating];
}

-(void)stopShowDomainView
{
    [_activity stopAnimating];
    self.hidden = YES;
}

@end
