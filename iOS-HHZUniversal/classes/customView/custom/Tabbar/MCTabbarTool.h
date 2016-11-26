//
//  MCTabbarTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCTabBar.h"

@interface MCTabbarTool : NSObject
@property (nonatomic, strong) MCTabBar * tabbar;

/**
 *  获取tabbar实例
 *
 *  @return
 */
+(instancetype)shareManager;


/**
 *  每次项目启动从Appdelegate获取tabbar实例
 *
 *  @param tabbar
 */
-(void)getTabbarInstance:(id)tabbar;


/**
 *  获取tabbar高度
 *
 *  @return
 */
-(CGFloat)getTabbarHeight;
@end
