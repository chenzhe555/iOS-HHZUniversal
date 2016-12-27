//
//  MCBlurItemView.h
//  XiaoMei
//
//  Created by chenzhe.376811578@qq.com on 16/8/3.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MCBlurItemView : UIView

/**
 *  创建单个Item
 *
 *  @param img   居中图片
 *  @param color 背景颜色
 *
 *  @return
 */
+(instancetype)createWithImage:(UIImage *)img Title:(NSString *)title BackGroundColor:(UIColor *)color;

/**
 *  动画偏移
 *
 *  @param yOffSet 偏移量
 */
-(void)AnimateWithYOffSet:(CGFloat)yOffSet;

@end

NS_ASSUME_NONNULL_END
