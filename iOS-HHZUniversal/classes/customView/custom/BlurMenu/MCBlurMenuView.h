//
//  MCBlurMenuView.h
//  XiaoMei
//
//  Created by chenzhe.376811578@qq.com on 16/8/3.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol MCBlurMenuViewDelegate <NSObject>
@optional
-(void)dlTapItemIndex:(NSInteger)index;

@end

@interface MCBlurMenuView : UIView
@property (nonatomic, assign) id<MCBlurMenuViewDelegate> delegate;

/**
 *  显示动画
 *
 *  @param imageArray 图片名称数组
 *  @param titleArray 文本数组
 *  @param colorArray 背景颜色数组
 */
-(void)showBlurMenuViewWithImageNameArray:(NSArray *)imageArray TitleArray:(NSArray *)titleArray ColorArray:(NSArray *)colorArray Delegate:(id<MCBlurMenuViewDelegate>)delegate;

/**
 *  隐藏掉BlurView
 */
-(void)hideBlurView;
@end
