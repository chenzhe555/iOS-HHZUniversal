//
//  MCTabbarTool.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCTabbarTool.h"

@interface MCTabbarTool()
@end

@implementation MCTabbarTool
-(void)getTabbarInstance:(id)tabbar
{
    self.tabbar = (MCTabBar *)tabbar;
}

+(instancetype)shareManager
{
    static MCTabbarTool * tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[MCTabbarTool alloc] init];
    });
    return tool;
}

-(CGFloat)getTabbarHeight
{
    return self.tabbar.customBarView.frame.size.height;
}

@end
