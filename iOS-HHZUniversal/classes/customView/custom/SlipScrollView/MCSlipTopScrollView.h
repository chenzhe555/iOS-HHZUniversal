//
//  MCSlipTopScrollView.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//顶部按钮分布规则
typedef NS_ENUM(NSInteger,MCSlipTopScrollViewItemAreaType) {
    MCSlipTopScrollViewItemAreaTypeRegulation = 111,    //根据文字宽度最大均等分配
    MCSlipTopScrollViewItemAreaTypeNotRegulation,       //根据文字宽度不均等分配
    MCSlipTopScrollViewItemAreaTypeByScreenWidth,       //根据屏幕大小平均分配
};


/*item底部左右额外加的间隙 默认15*/
#define kMCSlideScrollViewDefaultSpace                      10

@interface MCSlipTopScrollView : UITableView
#pragma mark 对外必须实现

/**
 *  显示文字的数据源
 */
@property (nonatomic, strong) NSMutableArray * dataArray;

#pragma mark 对外可选实现

/**
 *  顶部视图高度(默认40)
 */
@property (nonatomic, assign) CGFloat topScrollHeight;

/**
 *  缓存的高度数组
 */
@property (nonatomic, strong) NSMutableArray * heightArray;

/**
 *  当前文本最大宽
 */
@property (nonatomic, assign) CGFloat maxHeight;

/**
 *  label宽度分布类型(默认 MCSlipTopScrollViewItemAreaTypeByScreenWidth)
 */
@property (nonatomic, assign) MCSlipTopScrollViewItemAreaType areaType;


@end
