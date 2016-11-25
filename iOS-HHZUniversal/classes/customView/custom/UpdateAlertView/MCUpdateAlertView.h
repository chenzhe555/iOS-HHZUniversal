//
//  MCAlertView.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


/*
 专门用做更新的弹框视图
 */

#import <UIKit/UIKit.h>

@protocol MCUpdateAlertViewDelegate <NSObject>

@optional
-(void)dlClickedMCAlertView:(id)alertView andClickedIndex:(NSInteger)index;

@end

@interface MCUpdateAlertView : UIView
@property (nonatomic, assign) id<MCUpdateAlertViewDelegate> delegate;

/**
 *  能左对齐的AlertView(目前只用于更新提示)
 *
 *  @param title       标题
 *  @param message     文本内容
 *  @param delegate    委托对象
 *  @param buttonArray 按钮数组
 */
-(void)initWithTitle:(NSString *)title andMessage:(NSString *)message andDelegate:(id<MCUpdateAlertViewDelegate>)delegate andButtonTitles:(NSArray *)buttonArray;
@end
