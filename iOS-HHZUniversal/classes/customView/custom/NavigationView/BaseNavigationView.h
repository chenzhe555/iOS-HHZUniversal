//
//  BaseNavigationView.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 Demo: 
 
 */

#import <UIKit/UIKit.h>
#import "BaseNaviView.h"

//Navi整体高度
static const CGFloat topNavigationHeight = 44.0f;

static const CGFloat barItemSpace = 15.0f;

@interface BaseNavigationView : NSObject
/**
 *  创建导航视图
 *
 *  @param title         文字
 *  @param image         正常情况下图片
 *  @param selectedImage 选中图片
 *  @param vc            当前的VC
 *  @param clickAction   点击事件
 */
+(UIBarButtonItem *)createNaviWithTitle:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction;
@end
