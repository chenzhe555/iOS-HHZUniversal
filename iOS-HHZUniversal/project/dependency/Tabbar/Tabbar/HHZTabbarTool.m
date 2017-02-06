//
//  HHZTabbarTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZTabbarTool.h"

@implementation HHZTabbarTool
-(void)getTabbarInstance:(id)tabbar
{
    self.tabbar = (HHZTabbar *)tabbar;
}

+(instancetype)shareManager
{
    static HHZTabbarTool * tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[HHZTabbarTool alloc] init];
    });
    return tool;
}

-(CGFloat)getTabbarHeight
{
    return [self.tabbar getTabbarHeight];
}
@end
