//
//  MCActivityLoadingView.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCActivityLoadingView.h"
#import "HHZLabel.h"
#import "HHZKitTool.h"

//MCActivityView宽高(带文字)
#define kMCActivityViewBGWidth 120.0f
#define kMCActivityViewBGHeight 120.0f

//MCActivityView宽高(不带文字)
#define kMCActivityViewNoTextBGWidth 70.0f
#define kMCActivityViewNoTextBGHeight 70.0f

//文字距bgView左右间隙
#define kMCActivityViewLeftSpace       6.0f

@interface MCActivityLoadingView()
/**
 *  菊花转
 */
@property (nonatomic, strong) UIActivityIndicatorView * activity;

/**
 *  显示的文字
 */
@property (nonatomic, strong) HHZLabel * contentLabel;
@end

@implementation MCActivityLoadingView

+(instancetype)shareLoadingView
{
    static MCActivityLoadingView * custom = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        custom = [[MCActivityLoadingView alloc] init];
        UIWindow * window = [HHZKitTool getMainWindow];
        custom.frame = window.bounds;
        [window addSubview:custom];
        custom.hidden = YES;
    });
    return custom;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[HHZKitTool getMainWindow] insertSubview:self atIndex:(INT32_MAX - 1)];
        
        self.bgView = [[UIView alloc] init];
        self.bgView.backgroundColor = [UIColor lightGrayColor];
        self.bgView.layer.cornerRadius = 5.0f;
        self.bgView.layer.masksToBounds = YES;
        
        [self addSubview:self.bgView];
        
        _activity = [[UIActivityIndicatorView alloc] init];
        _activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [self.bgView addSubview:_activity];
        
        _contentLabel = [[HHZLabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.limitWidth = (kMCActivityViewBGWidth - kMCActivityViewLeftSpace*2);
        _contentLabel.font = [UIFont systemFontOfSize:14.0f];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor whiteColor];
        [self.bgView addSubview:_contentLabel];
        
        _titleDic = [NSMutableDictionary dictionary];
    }
    return self;
}


-(void)showMCActivityViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText
{
    [super initTheme];
    
    self.frame = CGRectMake(self.x, topSpace, self.width, SCREENH - topSpace - bottomSpace);
    
    if (labelText == nil)
    {
        [self updateFrameWithTextOrNot:NO andText:labelText];
    }
    else
    {
        [self updateFrameWithTextOrNot:YES andText:labelText];
    }
    
    [_activity startAnimating];
    
    self.loadingRetainCount++;
}

-(void)showMCActivityViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText andKey:(NSString *)key
{
    [super initTheme];
    
    self.frame = CGRectMake(self.x, topSpace, self.width, SCREENH - topSpace - bottomSpace);
    
    if (labelText == nil)
    {
        [self updateFrameWithTextOrNot:NO andText:labelText];
    }
    else
    {
        [_titleDic setObject:labelText forKey:key];
        [self updateFrameWithTextOrNot:YES andText:labelText];
    }
    
    [_activity startAnimating];
    
    self.loadingRetainCount++;
}

-(void)updateFrameWithTextOrNot:(BOOL)haveText andText:(NSString *)labelText
{
    if (haveText)
    {
        _contentLabel.text = labelText;
        self.bgView.frame = CGRectMake((self.width - kMCActivityViewBGWidth)/2, (self.height - kMCActivityViewBGHeight)/2, kMCActivityViewBGWidth, kMCActivityViewBGHeight);
        _activity.center = CGPointMake(self.bgView.width/2, self.bgView.height/2 - 15);
        _contentLabel.frame = CGRectMake((self.bgView.width - _contentLabel.width)/2, self.bgView.height - _contentLabel.height - 15, _contentLabel.width, _contentLabel.height);
        _contentLabel.hidden = NO;
    }
    else
    {
        _contentLabel.text = @"";
        self.bgView.frame = CGRectMake((self.width - kMCActivityViewNoTextBGWidth)/2, (self.height - kMCActivityViewNoTextBGHeight)/2, kMCActivityViewNoTextBGWidth, kMCActivityViewNoTextBGHeight);
        _activity.center = CGPointMake(self.bgView.width/2, self.bgView.height/2);
        _contentLabel.hidden = YES;
    }
}

-(void)stopLoadingView
{
    self.loadingRetainCount--;
    if (self.loadingRetainCount == 0)
    {
        [super stopLoadingView];
        [_activity stopAnimating];
    }
}

-(void)stopLoadingViewWithKey:(NSString *)key
{
    self.loadingRetainCount--;
    [_titleDic removeObjectForKey:key];
    
    if (_titleDic.allKeys.count == 0)
    {
        [self updateFrameWithTextOrNot:NO andText:nil];
    }
    else
    {
        [self updateFrameWithTextOrNot:YES andText:_titleDic[_titleDic.allKeys[0]]];
    }
    
    if (self.loadingRetainCount == 0)
    {
        [super stopLoadingView];
        _titleDic = [NSMutableDictionary dictionary];
        [_activity stopAnimating];
    }
}

-(void)stopLoadingViewImmediately
{
    self.loadingRetainCount = 0;
    [super stopLoadingView];
    _titleDic = [NSMutableDictionary dictionary];
    [_activity stopAnimating];
}


@end