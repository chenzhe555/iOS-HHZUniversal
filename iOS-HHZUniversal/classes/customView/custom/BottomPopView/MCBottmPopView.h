//
//  MCBottmPopView.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 Demo:(从上至下 索引从0开始)
 [[MCBottmPopView shareManager] showPopViewWithTitleArray:@[@"111",@"222",@"333333333"] andColorArray:@[[UIColor redColor],[UIColor redColor],[UIColor redColor]] andDelegate:self];
 */

#import "BasePopView.h"

@interface MCBottmPopView : BasePopView
/**
 *  底部弹出框效果
 *
 *  @param titleArray 显示的文字数组
 *  @param colorArray 显示的颜色数组
 *  @param delegat    委托对象
 */
-(void)showPopViewWithTitleArray:(NSArray *)titleArray andColorArray:(NSArray *)colorArray andDelegate:(id<BasePopViewDelegate>)delegat;
@end
