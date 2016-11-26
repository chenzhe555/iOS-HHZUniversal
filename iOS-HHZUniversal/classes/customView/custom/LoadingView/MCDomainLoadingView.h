//
//  MCDomainLoadingView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


/*
 贴在父视图上的
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MCDomainLoadingView : UIView

/**
 *  创建add在父视图上的Domain视图
 *
 *  @param frame      当前坐标
 *  @param parentView 父视图
 *
 *  @return
 */
+(instancetype)createDomainLoadingView:(CGRect)frame parentView:(UIView *)parentView;

/**
 *  开始显示文字
 *
 *  @param showText 显示的文字
 */
-(void)startShowWithText:(NSString *)showText;

/**
 *  关闭显示文字
 */
-(void)stopShowDomainView;

@end
