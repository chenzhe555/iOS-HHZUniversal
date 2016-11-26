//
//  MCRedPointView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 Demo:
 [MCRedPointView appendRedPointView:imgView andRedCount:11 andRect:CGRectZero];
 [MCRedPointView appendRedPointView:imgView andRedCount:100 andRect:CGRectZero];
 [MCRedPointView appendRedPointViewNoAdd:imgView andRedCount:100 andRect:CGRectZero];
 
 MCRedPointView * redView = [MCRedPointView createRedView:CGRectZero parentView:imgView];
 [redView  chanegRedCount:100];
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString * const kNotificationChenzhe;


@interface MCRedPointView : UIView
#pragma mark 采用类方法实现红点(待弃用)
/**
 *  添加红点:传入带数字的红点rect，并add到相应的parentView(累加的,默认CGRectZero为26*26)
 *
 *  @param parentView 父视图
 *  @param redCount   红点数量
 *  @param rect       相对于父视图坐标
 */
+(void)appendRedPointView:(UIView *)parentView andRedCount:(NSInteger)redCount andRect:(CGRect)rect;

/**
 *  添加红点:传入带数字的红点rect，并add到相应的parentView(不是累加的,默认CGRectZero为26*26)
 *
 *  @param parentView 父视图
 *  @param redCount   红点数量
 *  @param rect       相对于父视图坐标
 */
+(void)appendRedPointViewNoAdd:(UIView *)parentView andRedCount:(NSInteger)redCount andRect:(CGRect)rect;

#pragma mark 红点视图对象
/**
 *  创建红点视图
 *
 *  @param frame      红点坐标
 *  @param parentView 父视图
 *
 *  @return
 */
+(instancetype)createRedView:(CGRect)frame parentView:(UIView *)parentView;

/**
 *  改变红点数
 *
 *  @param realCount 红点数
 */
-(void)chanegRedCount:(NSInteger)realCount;
@end
