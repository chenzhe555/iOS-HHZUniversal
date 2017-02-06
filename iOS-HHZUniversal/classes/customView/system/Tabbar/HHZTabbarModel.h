//
//  HHZTabbarModel.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHZTabbarModel : NSObject
/**
 *  VC类名
 */
@property (nonatomic, copy) NSString * sourceVC;
/**
 *  底部Tabbar显示的名字
 */
@property (nonatomic, copy) NSString * title;
/**
 *  底部Tabbar正常的图片
 */
@property (nonatomic, copy) NSString * normalImageUrl;
/**
 *  底部Tabbar选中的图片
 */
@property (nonatomic, copy) NSString * selectImageUrl;
/**
 *  模拟Tabbar中间按钮大，并且不触发Tabbar事件
 */
@property (nonatomic, assign) BOOL isBigNoClicked;
@end
