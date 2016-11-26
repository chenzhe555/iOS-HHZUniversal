//
//  MCSlipScrollView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


/*
 类似新闻类的滚动视图
 */
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MCSlipTopScrollView.h"
#import "MCSlipMainScrollView.h"

@protocol MCSlipScrollViewDelegate <NSObject>

@optional
//获取顶部滚动视图文字数组
-(NSMutableArray *)mcSlipScrollViewTopTitleArray:(UIView *)topScrollView;

//底部视图滚动回调
-(void)mcSlipViewBottomViewScroll:(UIViewController *)vc index:(NSInteger)index;

@required
//获取底部滚动视图数组
-(NSMutableArray *)mcSlipScrollViewBottomViewArray:(UIView *)bottomView;

@end


//顶部滚动View的类型
typedef NS_ENUM(NSInteger,MCSlipTopScrollViewItemFillType) {
    MCSlipTopScrollViewItemFillTypeNone = 222,      //没有任何效果
    MCSlipTopScrollViewItemFillTypeLine,            //底部有一根线
    MCSlipTopScrollViewItemFillTypeFill,            //文字被包住
    MCSlipTopScrollViewItemFillTypeTotalFill,       //每个Item全部被包住
};

@interface MCSlipScrollView : UIView
/**
 *  是否含有顶部视图,实例化完后最后设置
 */
@property (nonatomic, assign) BOOL isHaveTopScroll;

@property (nonatomic, assign) id<MCSlipScrollViewDelegate> delegate;

#pragma mark 对外必须实现
/**
 *  顶部可滚动区域
 */
@property (nonatomic, strong) MCSlipTopScrollView * topScrollView;

#pragma mark 对外可选择实现
/**
 *  顶部额外滚动View类型(默认 MCSlipTopScrollViewItemFillTypeNone)
 */
@property (nonatomic, assign) MCSlipTopScrollViewItemFillType fillType;



/**
 *  底部滚动视图
 */
@property (nonatomic, strong) MCSlipMainScrollView * bottomScrollView;


/**
 *  顶部滚动到某个Index处(默认第一个)
 *
 *  @param scrollIndex 以0为开始
 */
-(void)switchTopScrollToIndex:(NSInteger)scrollIndex;

/**
 *  底部滚动到某个Index处(默认第一个)
 *
 *  @param scrollIndex 以0为开始
 */
-(void)switchBottomScrollToIndex:(NSInteger)scrollIndex;
@end
