//
//  BasePopView.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BasePopView.h"
#import "HHZKitTool.h"

@implementation BasePopView

+(instancetype)shareManager
{
    static id custonInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        custonInstance = [[self alloc] init];
    });
    return custonInstance;
}

-(void)initTheme
{
    UIWindow * window = [HHZKitTool getMainWindow];
    self.frame = window.bounds;
    
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor lightGrayColor];
    _bgView.frame = self.bounds;
    _bgView.alpha = 0.8f;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stopView)];
    [_bgView addGestureRecognizer:tap];
    
    [self addSubview:_bgView];
    [window addSubview:self];
}

-(void)stopView
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.hidden = YES;
}

@end
