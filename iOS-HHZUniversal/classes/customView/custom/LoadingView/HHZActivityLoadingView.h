//
//  HHZActivityLoadingView.h
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/8.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseLoadingView.h"

@interface HHZActivityLoadingView : BaseLoadingView
/**
 *  显示MCActivityView(文本覆盖)
 *
 *  @param topSpace  不可点击区域距离顶部的距离
 *  @param labelText 显示的文本信息
 */
-(void)showMCActivityViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText;

/**
 *  显示MCActivityView(文本保留不覆盖)
 *
 *  @param topSpace                   不可点击区域距离顶部的距离
 *  @param bottomSpace                不可点击区域距离底部的距离
 *  @param labelText                  显示的文本信息
 *  @param Key 文本的键
 */
-(void)showMCActivityViewTopSpace:(CGFloat)topSpace andBottomSpace:(CGFloat)bottomSpace andText:(NSString *)labelText andKey:(NSString *)key;

/**
 *  针对文本保留不覆盖的Stop方法
 *
 *  @param key 文本的键
 */
-(void)stopLoadingViewWithKey:(NSString *)key;

/**
 *  立即结束Loading
 */
-(void)stopLoadingViewImmediately;
@end
