//
//  LoadingView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseLoadingView.h"
#import "HHZKitTool.h"
#import "HHZMethodException.h"

@implementation BaseLoadingView

+(instancetype)shareLoadingView
{
    @throw [HHZMethodException exceptionWithClass:@"BaseLoadingView" Method:@"shareLoadingView"];
}

-(instancetype)init
{
    if (self = [super init]) {
        self.bgView = [[UIView alloc] init];
        self.bgView.backgroundColor = [UIColor lightGrayColor];
        self.bgView.layer.cornerRadius = 5.0f;
        self.bgView.layer.masksToBounds = YES;
        [self addSubview:self.bgView];
    }
    return self;
}

-(void)initTheme
{
    self.hidden = NO;
}

-(void)stopLoadingView
{
    self.hidden = YES;
}

-(void)exchangeNewMainWindow
{
    [self removeFromSuperview];
    UIWindow * window = [HHZKitTool getMainWindow];
    self.backgroundColor = [UIColor clearColor];
    self.frame = window.bounds;
    [window addSubview:self];
    self.hidden = YES;
}
@end
