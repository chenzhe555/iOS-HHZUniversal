//
//  HHZLaunchView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/8.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 待完成!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@protocol HHZLaunchViewDelegate <NSObject>
/**
 *  点击Launch图片的事件回调
 */
-(void)dlLaunchViewTap;

@end

@interface HHZLaunchView : UIView<CAAnimationDelegate>

/**
 *  网页跳转情况:跳转的Html地址
 */
@property (nonatomic, copy) NSString * htmlUrl;

/**
 *  网页跳转情况:跳转的Html标题
 */
@property (nonatomic, copy) NSString * htmlTitle;

/**
 *  下载图片
 *
 *  @param imgURL 图片下载链接
 */
-(void)downLoadImage:(NSString *)imgURL UrlCache:(BOOL)isUrlCache;

/**
 *  显示LaunchView
 */
-(void)showLaunchViewWithDelegate:(id<HHZLaunchViewDelegate>)delegate PlaceHoldImageName:(NSString *)placeHoldImageName;

/**
 *  设置显示时间
 */
-(void)setImageShowTime:(CGFloat)time;
@end
