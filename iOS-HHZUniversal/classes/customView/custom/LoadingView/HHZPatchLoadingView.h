//
//  HHZPatchLoadingView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/8.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface HHZPatchLoadingView : UIView
/**
 *  创建add在父视图上的Domain视图
 *
 *  @param frame      当前坐标
 *  @param parentView 父视图
 *
 *  @return
 */
+(instancetype)createPatchLoadingView:(CGRect)frame parentView:(UIView *)parentView;

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
