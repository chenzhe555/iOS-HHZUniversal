//
//  HHZIQKeyboardManagerTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HHZIQKeyboardManagerTool : NSObject
/**
 *  注册IQKeyboardManager
 */
+(void)registIQKeyboardManager;

/**
 *  设置点击背景收回键盘
 */
+(void)shouldResignOnTouchOutside;
@end
