//
//  MCQRCenterView.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MCQRCenterView : UIView

/**
 *  四周灰色区域
 */
@property (nonatomic, strong) UIColor * borderColor;

/**
 *  四个转角颜色
 */
@property (nonatomic, strong) UIColor * cornerColor;

/**
 *  四个转角长度
 */
@property (nonatomic, assign) CGFloat cornerWidth;

/**
 *  中间白色透明区域
 */
@property (nonatomic, assign) CGRect centerClearRect;

@end
