//
//  MCLaunchView.h
//  iOS-HHZUniversal
//
//  Created by mc962 on 15/11/16.
//  Copyright © 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

/*
 做成唯一的实例或者自己初始化一个实例都可以，根据项目需求来决定
 */

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol MCLaunchViewDelegate <NSObject>

-(void)dlLaunchViewTap;

@end

@interface MCLaunchView : UIView

@property (nonatomic, assign) id<MCLaunchViewDelegate> delegate;

/**
 *  跳转的Html地址
 */
@property (nonatomic, copy) NSString * htmlUrl;

/**
 *  跳转的Html标题
 */
@property (nonatomic, copy) NSString * htmlTitle;

/**
 *  下载图片
 *
 *  @param imgURL 图片下载链接
 */
-(void)downLoadImage:(NSString *)imgURL;

/**
 *  显示LaunchView
 */
-(void)showLaunchViewWithDelegate:(id<MCLaunchViewDelegate>)delegate;

/**
 *  设置显示时间
 */
-(void)setImageShowTime:(CGFloat)time;

@end
