//
//  HHZTopShowAlertView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 2017/1/12.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "BaseAlertView.h"

typedef NS_ENUM(NSInteger,HHZTopShowAlertViewType) {
    HHZTopShowAlertViewTypeInfo = 1001,
    HHZTopShowAlertViewTypeWaring,
    HHZTopShowAlertViewTypeError
};

//TODO: 后续有美工了可以设计下，加几个Icon什么的
@interface HHZTopShowAlertView : BaseAlertView
/**
 *  展示顶部提示框
 *
 *  @param title   标题
 *  @param content 内容
 *  @param type    提示类型
 */
-(void)showAlertViewWithTitle:(NSString *)title Content:(NSString *)content Type:(HHZTopShowAlertViewType)type;

#pragma mark 改变颜色
/**
 *  改变顶部背景颜色
 *
 *  @param color 顶部背景颜色
 */
-(void)changeTopColor:(UIColor *)color;
/**
 *  改变底部背景颜色
 *
 *  @param color 底部背景颜色
 */
-(void)changeBottomColor:(UIColor *)color;
@end
