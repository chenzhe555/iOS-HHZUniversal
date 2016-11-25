//
//  MCBlurMenuView.m
//  XiaoMei
//
//  Created by mc962 on 16/8/3.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCBlurMenuView.h"
#import "MCBlurItemView.h"
#import "HHZKitTool.h"

@interface MCBlurMenuView()
@property (nonatomic, strong) NSMutableArray * itemArray;
@property (nonatomic, assign) int itemIndex;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, strong) UILabel * textLabel;
@end

@implementation MCBlurMenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _itemArray = [NSMutableArray array];
    }
    return self;
}

-(void)createBasic
{
    UIWindow * window = [HHZKitTool getMainWindow];
    self.frame = window.bounds;
    
    //创建毛玻璃背景
    [self createBlur:window];
    //创建文本Label
    [self createLabel];
    
    [window addSubview:self];
}

-(void)showBlurMenuViewWithImageNameArray:(NSArray *)imageArray TitleArray:(NSArray *)titleArray ColorArray:(NSArray *)colorArray Delegate:(id<MCBlurMenuViewDelegate>)delegate
{
    _delegate = delegate;
    [self createBasic];
    //添加Items
    [self addItems:imageArray TitleArray:titleArray ColorArray:colorArray];
}

-(void)createLabel
{
    _textLabel = [[UILabel alloc] init];
    _textLabel.text = @"陈哲是个好孩子~";
    _textLabel.font = [UIFont boldSystemFontOfSize:19.0];
    _textLabel.textColor = [UIColor colorWithRed:60/255.0 green:160/255.0 blue:244/255.0 alpha:1.0f];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    [self adjustLabelFrame];
    [self addSubview:_textLabel];
}

-(void)createBlur:(UIWindow *)window
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self blurIOS8];
    }
    else
    {
        [self blurCustom:window];
    }
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideBlurView)]];
}

#pragma mark 生成毛玻璃效果 分为iOS8以上以及以下版本两种方法
-(void)blurIOS8
{
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    view.frame = self.bounds;
    [self addSubview:view];
    [self showAlphaWithView:view];
}

-(void)blurCustom:(UIWindow *)window
{
    UIImage * image = [window generateScreenShot];
    UIImage * blurImage = [image blurImage];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:window.bounds];
    imageView.image = blurImage;
    [self addSubview:imageView];
    [self showAlphaWithView:imageView];
}

-(void)showAlphaWithView:(UIView *)view
{
    view.alpha = 0.0;
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hideBlurView
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self removeFromSuperview];
}

-(void)addItems:(NSArray *)itemArray TitleArray:(NSArray *)titleArray ColorArray:(NSArray *)colorArray
{
    CGFloat space = [self getSpace];
    CGFloat leftWidth = 0.0f;
    for (int i = 0; i < itemArray.count; ++i) {
        MCBlurItemView * view = [MCBlurItemView createWithImage:[UIImage imageNamed:itemArray[i]] Title:titleArray[i] BackGroundColor:colorArray[i]];
        view.tag = 300 + i;
        leftWidth = (SCREENW - 2*space - view.width*3)/2;
        view.frame = CGRectMake(leftWidth + (i%3)*(space + view.width),SCREENH + (i/3)*(space + view.height), view.width, view.height);
        [self addSubview:view];
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBlurItemView:)]];
        [_itemArray addObject:view];
    }
    _itemIndex = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(showAnimateDuring) userInfo:nil repeats:YES];
}

-(void)tapBlurItemView:(UITapGestureRecognizer *)tap
{
    if (_delegate && [_delegate respondsToSelector:@selector(dlTapItemIndex:)]) {
        [_delegate dlTapItemIndex:(tap.view.tag - 300)];
    }
}

-(void)showAnimateDuring
{
    if (_itemIndex < _itemArray.count) {
        [((MCBlurItemView *)_itemArray[_itemIndex]) AnimateWithYOffSet:[self getOffSet]];
        _itemIndex++;
    }
    else {
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark 根据屏幕获取不同数值

/**
 *  文本位置
 */
-(void)adjustLabelFrame
{
    if (kIS_iPhone4) {
        _textLabel.frame = CGRectMake(0, 95, SCREENW, 25);
    }
    else if (kIS_iPhone5) {
        _textLabel.frame = CGRectMake(0, 105, SCREENW, 25);
    }
    else if (kIS_iPhone6) {
        _textLabel.frame = CGRectMake(0, 115, SCREENW, 25);
    }
    else {
        _textLabel.frame = CGRectMake(0, 130, SCREENW, 25);
    }
}

/**
 *  偏移量
 *
 */
-(CGFloat)getOffSet
{
    if (kIS_iPhone4) {
        return 330;
    }
    else if (kIS_iPhone5) {
        return 390;
    }
    else if (kIS_iPhone6) {
        return 470;
    }
    else {
        return 500;
    }
}

/**
 *  Item的间隙
 */
-(CGFloat)getSpace
{
    if (kIS_iPhone4) {
        return 30;
    }
    else if (kIS_iPhone5) {
        return 30;
    }
    else if (kIS_iPhone6) {
        return 30;
    }
    else {
        return 35;
    }
}
@end
