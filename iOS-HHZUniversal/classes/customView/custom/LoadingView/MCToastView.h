//
//  MCToastView.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseLoadingView.h"

typedef void(^toastFinishedBlock) ();

typedef NS_ENUM(NSUInteger, MCToastViewShowType) {
    MCToastViewShowTypeBottom,
    MCToastViewShowTypeCenter,
    MCToastViewShowTypeImageCenter,
};

@interface MCToastView : BaseLoadingView
/**
 *  展示Toast,传入字符串,不带回调
 *
 *  @param toastString 显示的字符串
 */
-(void)showToast:(NSString *)toastString;


/**
 *  展示Toast,传入字符串,带回调(位于底部)
 *
 *  @param toastString 显示的字符串
 *  @param block       动画结束回调
 */
-(void)showToast:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block;


/**
 *  展示Toast,传入字符串,不带带回调(位于屏幕中心)
 *
 *  @param toastString 显示的字符串
 *  @param block       动画结束回调
 */
-(void)showToastInCenter:(NSString *)toastString;


/**
 *  展示Toast,传入字符串,带回调(位于屏幕中心)
 *
 *  @param toastString 显示的字符串
 *  @param block       动画结束回调
 */
-(void)showToastInCenter:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block;

/**
 *  展示Toast(只处于屏幕中心)
 *
 *  @param showImage   显示的图片
 *  @param toastString 显示的字符串
 */
-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString;

/**
 *  展示Toast(只处于屏幕中心)
 *
 *  @param showImage   显示的图片
 *  @param toastString 显示的字符串
 *  @param block       动画结束回调
 */
-(void)showToastWithImage:(UIImage *)showImage andToastString:(NSString *)toastString andFinishedBlock:(toastFinishedBlock)block;
@end
