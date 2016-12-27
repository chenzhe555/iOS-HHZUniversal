//
//  BaseLoadingView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseLoadingView : UIView
/**
 *  放置控件的View
 */
@property (nonatomic, strong) UIView * bgView;

/**
 *  Loading的引用计数
 */
@property (nonatomic, assign) NSInteger loadingRetainCount;


/**
 *  获取LoadingView实例
 *
 *  @return
 */
+(instancetype)shareLoadingView;

/**
 *  初始化部分数据
 */
-(void)initTheme;

/**
 *  关闭LoadingView
 */
-(void)stopLoadingView;

/**
 *  切换RootViewController后调用
 */
-(void)exchangeNewMainWindow;
@end
