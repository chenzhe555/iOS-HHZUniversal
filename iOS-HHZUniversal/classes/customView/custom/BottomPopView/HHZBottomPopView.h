//
//  HHZBottomPopView.h
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/12/10.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BasePopView.h"

@interface HHZBottomPopView : BasePopView

-(void)showPopViewWithCancelTitle:(NSString *)cancelTitle andotherTitles:(NSArray *)otherTitles andDelegate:(id<PopViewDelegate>)delegate;

/**
 *  底部弹出框效果
 *
 *  @param titleArray 显示的文字数组
 *  @param colorArray 显示的颜色数组
 *  @param delegat    委托对象
 */
-(void)showPopViewWithTitleArray:(NSArray *)titleArray andColorArray:(NSArray *)colorArray andDelegate:(id<PopViewDelegate>)delegate;
@end
