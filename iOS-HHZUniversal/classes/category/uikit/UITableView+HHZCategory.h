//
//  UITableView+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@interface UITableView (initSomeThing)
/**
 *  绑定MCTableView的委托对象，并且初始化一些数据
 *
 *  @param target 委托对象目标
 */
-(void)bindDelegateWithTarget:(id)target;
@end
