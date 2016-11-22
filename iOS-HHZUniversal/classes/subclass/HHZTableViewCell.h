//
//  HHZTableViewCell.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHZTableViewCell : UITableViewCell
/**
 *  Cell下方的分割线
 */
@property (nonatomic, strong) UIView * spliteLine;

/**
 *  Cell用于存储Index
 */
@property (nonatomic, strong) NSIndexPath * cellIndexPath;
@end
