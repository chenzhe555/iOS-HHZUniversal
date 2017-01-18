//
//  BaseAlertView.h
//  iOS-HHZUniversal
//
//  Created by 376811578@qq.com on 2017/1/12.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HHZAlertViewType){
    HHZAlertViewTypeOnlyOnce,
    HHZAlertViewTypeAlways
};

@interface BaseAlertView : UIView
/**
 *  放置控件的View
 */
@property (nonatomic, strong) UIView * bgView;

/**
 *  动画是否完成
 */
@property (nonatomic, assign) BOOL isFinished;
/**
 *  暂存的数据
 */
@property (nonatomic, strong) NSMutableArray * dataArray;

//TODO: 后续有时间加入以下功能
/**
 *  Alert的引用计数
 */
@property (nonatomic, assign) NSInteger AlertRetainCount;

/**
 *  显示Alert的类型
 */
@property (nonatomic, assign) HHZAlertViewType showAlertType;


/**
 *  获取AlertView实例
 *
 *  @return
 */
+(instancetype)shareManager;

/**
 *  显示Alert视图
 */
-(void)showAlertView;

@end
