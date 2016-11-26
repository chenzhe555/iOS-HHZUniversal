//
//  BasePopView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol BasePopViewDelegate <NSObject>

@optional
-(void)dlBasePopViewButtonClicked:(NSNumber *)btnTag;

@end

@interface BasePopView : UIView
@property (nonatomic, assign) id<BasePopViewDelegate> delegate;
/**
 *  整个灰色背景
 */
@property (nonatomic, strong) UIView * bgView;
/**
 *  获取实例变量
 *
 *  @return
 */
+(instancetype)shareManager;

/**
 *  用于初始化BottomPopView以及子类,实现自己弹出方式时继承即可
 */
-(void)initTheme;


/**
 *  用于隐藏BottomPopView以及子类并销毁实例，实现自己方式继承即可(父类不带动画效果)
 */
-(void)stopView;

@end
