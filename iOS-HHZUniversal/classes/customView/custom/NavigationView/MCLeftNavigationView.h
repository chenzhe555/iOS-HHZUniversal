//
//  MCLeftNavigationView.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseNavigationView.h"


@interface MCLeftNavigationView : BaseNavigationView
/**
 *  navi左视图(带返回箭头的特殊性,图片名字为img_back_normal:10*18,选中为img_back_select)
 *
 *  @param title       文字文本
 *  @param vc          当前视图控制器
 *  @param clickAction 响应事件
 */
+(void)createWithBackButtonTitle:(NSString *)title andNavi:(UIViewController *)vc andSEL:(SEL)clickAction;


/**
 *  创建左导航视图
 *
 *  @param title         文字
 *  @param image         正常情况下图片
 *  @param selectedImage 选中图片
 *  @param vc            当前的VC
 *  @param clickAction   点击事件
 */
+(void)createWithLeftTitle:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction;
@end
