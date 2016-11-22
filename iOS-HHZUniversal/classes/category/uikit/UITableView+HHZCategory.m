//
//  UITableView+HHZCategory.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "UITableView+HHZCategory.h"

@implementation UITableView (initSomeThing)
-(void)initializationData
{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)bindDelegateWithTarget:(id)target
{
    [self initializationData];
    self.dataSource = target;
    self.delegate = target;
}
@end
