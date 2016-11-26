//
//  MCTabbarItem.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class MCTabbarItem;

typedef NS_ENUM(NSInteger,MCTabbarItemType){
    MCTabbarItemTypeOnlyImage = 100,          //图片(默认)
    MCTabbarItemTypeImageAndText1,            //图片在上、文字在下
};

@protocol MCTabbarItemDelegate <NSObject>

-(void)barItemClicked:(MCTabbarItem *)item;

@end


#pragma mark MCTabbarItem(只支持图片、图片在上文字在下两种情况)
@interface MCTabbarItem : UIView
@property (nonatomic, assign) id<MCTabbarItemDelegate> delegate;
/**
 *  当前Item显示类型
 */
@property (nonatomic, assign) MCTabbarItemType itemType;
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
-(void)createWithText:(NSString *)text normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectImage Delegate:(id<MCTabbarItemDelegate>)delegate;

/**
 *  图片开始动画
 */
-(void)startAnimation;
@end
