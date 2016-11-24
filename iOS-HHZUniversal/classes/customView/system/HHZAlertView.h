//
//  HHZAlertView.h
//  iOS_Universal_Project
//
//  Created by mc962 on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@protocol HHZAlertViewDelegate <NSObject>

-(void)dlMCAlertView:(UIAlertController *)alertController clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface HHZAlertView : NSObject

/**
 *  统一调用(iOS8以前自行实现AlertView的协议，iOS8以后实现HHZAlertViewDelegate事件)
 *
 *  @param title             
 *  @param message
 *  @param delegate
 *  @param otherButtonTitles
 *  @param tag
 */
+(void)showAlertViewTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate ButtonTitles:(NSArray *)otherButtonTitles Tag:(NSInteger)tag;

/**
 *  iOS8以前用的弹框(无返回值)
 *
 *  @param title
 *  @param message
 *  @param delegate
 *  @param otherButtonTitles
 *  @param tag
 *
 *  @return
 */
+(void)showAlertNoneReturnTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate ButtonTitles:(NSArray *)otherButtonTitles Tag:(NSInteger)tag;

/**
 *  iOS8以后弹框(无返回值)
 *
 *  @param title
 *  @param message
 *  @param delegate
 *  @param otherButtonTitles
 *  @param tag
 *
 *  @return
 */
+(void)showAlertControllerNoneReturnTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate ButtonTitles:(NSArray *)otherButtonTitles Tag:(NSInteger)tag;
@end
