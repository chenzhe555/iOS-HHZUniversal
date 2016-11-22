//
//  UITableViewCell+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@interface UITableViewCell (ExtraView)

/**
 *  增加一些基本参数配置
 */
-(void)addBasicInfoConfig;

/**
 *  添加默认的分割线
 *
 *  @param color 分割线颜色，nil为默认颜色
 */
-(void)addDefaultSeparateLine:(UIColor *)color;


/**
 *  配置Cell
 *
 *  @param tableView 当前tableview
 *  @param indexPath 索引值
 *
 *  @return
 */
+(instancetype)configCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath;

@end