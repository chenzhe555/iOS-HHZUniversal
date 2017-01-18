//
//  HHZRedPointView.h
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface HHZRedPointView : UIView
/**
 *  创建红点视图（如果不传frame(CGRectZero),则采用默认右上角，默认宽高）
 *
 *  @param frame      红点坐标
 *  @param parentView 父视图
 *
 *  @return
 */
+(instancetype)createRedPointView:(CGRect)frame parentView:(UIView *)parentView;

/**
 *  改变文字大小
 *
 *  @param fontSize 
 */
-(void)changeTextFont:(CGFloat)fontSize;

/**
 *  红点的变化值(可传正负值)
 *
 *  @param realCount 红点数
 */
-(void)addRedCount:(NSInteger)addCount;

/**
 *  设置最大显示的数字(默认99,最大10000)
 *
 *  @param maxCount 
 */
-(void)setMaxShowCount:(NSInteger)maxCount;
@end
