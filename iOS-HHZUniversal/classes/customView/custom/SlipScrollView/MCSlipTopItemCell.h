//
//  MCSlipTopItemCell.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHZLabel.h"

@interface MCSlipTopItemCell : UITableViewCell
+(instancetype)configCellWithTableView:(UITableView *)tableView;
#pragma mark 对外可选实现
/**
 *  显示的文字
 */
@property (nonatomic, strong) HHZLabel * titleLabel;

/**
 *  当前是否被选中
 */
@property (nonatomic, assign) BOOL isSelected;

/**
 *  选中后文字的动画效果
 */
-(void)titleShowAnimate;
@end
