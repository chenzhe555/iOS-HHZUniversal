//
//  BaseTabbar.h
//  core-ios-oc
//
//  Created by mc962 on 16/2/27.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MCTabbarItem.h"

@interface BaseTabbar : UITabBarController<MCTabbarItemDelegate>
/**
 *  自定义的tabbarView，放在tabVC上面
 */
@property (readonly,strong, nonatomic) UIView * customBarView;
#pragma mark 创建Tabbar视图
/**
 *  设置数据源
 *
 *  @param titleArr      底部文字数组
 *  @param normalArray   底部正常图片数组
 *  @param selectedArray 底部选中图片数组
 */
-(void)setTitleArray:(NSArray *)titleArr normalImageArray:(NSArray *)normalArray selectedImageArray:(NSArray *)selectedArray;

/**
 *  设置数据源
 *
 *  @param titleArr      底部文字数组
 *  @param normalArray   底部正常图片数组
 *  @param selectedArray 底部选中图片数组
 *  @param extraArray    额外配置参数数组
 */
-(void)setTitleArray:(NSArray *)titleArr normalImageArray:(NSArray *)normalArray selectedImageArray:(NSArray *)selectedArray ExtraArray:(NSArray *)extraArray;

/**
 *  数据源设置完后，创建自定义视图
 */
-(void)createTabbar;



#pragma mark Tabbar的显示操作
/**
 *  是否以动画形式显示tabbar
 */
-(void)showTabbarView:(BOOL)isAnimate;

/**
 *  是否以动画形式隐藏tabbar
 */
-(void)hideTabbarView:(BOOL)isAnimate;

/**
 *  传入index索引值切换到相应tabbarItem目录下
 *
 *  @param index
 */
-(void)switchTabbarItem:(NSInteger)index;


#pragma mark 设置一些基本参数(必须在create之前传入)
/**
 *  设置动画时间
 *
 *  @param time 
 */
-(void)setAnimationTime:(CGFloat)time;

#pragma mark 对外接口,不主动调用
-(void)exchangeCurrentItem:(MCTabbarItem *)item;

@end
