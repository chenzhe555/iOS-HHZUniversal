//
//  HHZViewController.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


@interface HHZViewController : UIViewController
/**
 *  初始化数据(重写)
 */
-(void)initializeData;

/**
 *  创建主视图(重写)
 */
-(void)createMainView;
/**
 *  离开当前视图(重写)
 */
-(void)back;
@end
