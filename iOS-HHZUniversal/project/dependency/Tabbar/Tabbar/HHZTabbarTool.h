//
//  HHZTabbarTool.h
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HHZTabbar.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHZTabbarTool : NSObject
@property (nonatomic, strong) HHZTabbar * tabbar;

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

NS_ASSUME_NONNULL_END
