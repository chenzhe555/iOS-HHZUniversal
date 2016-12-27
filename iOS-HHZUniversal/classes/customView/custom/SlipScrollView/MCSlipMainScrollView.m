//
//  MCSlipMainScrollView.m
//  XiaoMei
//
//  Created by chenzhe.376811578@qq.com on 16/7/1.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCSlipMainScrollView.h"

@implementation MCSlipMainScrollView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.pagingEnabled = YES;
        self.bounces = NO;
    }
    return self;
}

@end
