//
//  HHZTabbarItem.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/6.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class HHZTabbarItem;

typedef NS_ENUM(NSInteger,HHZTabbarItemType){
    HHZTabbarItemTypeOnlyImage = 100,          //图片(默认)
    HHZTabbarItemTypeImageAndText1,            //图片在上、文字在下
};

@protocol HHZTabbarItemDelegate <NSObject>

-(void)barItemClicked:(HHZTabbarItem *)item;

@end


//目前只支持图片、图片在上文字在下两种情况
@interface HHZTabbarItem : UIView
@property (nonatomic, assign) id<HHZTabbarItemDelegate> delegate;
/**
 *  当前Item显示类型
 */
@property (nonatomic, assign) HHZTabbarItemType itemType;
/**
 *  当前Item选中状态
 */
@property (nonatomic, assign) BOOL isSelected;

/**
 *  额外加入的参数(模拟Tabbar中间加个大按钮的效果)
 */
@property (nonatomic, assign) BOOL isBigNoClicked;

/**
 *  创建Item视图
 *
 *  @param text        底部文字
 *  @param normalImage 底部正常图片
 *  @param selectImage 底部选中图片
 *  @param delegate    回调
 */
-(void)createWithText:(NSString *)text normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectImage Delegate:(id<HHZTabbarItemDelegate>)delegate;

/**
 *  图片开始动画
 */
-(void)startAnimation;
@end
