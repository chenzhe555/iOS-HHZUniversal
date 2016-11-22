//
//  NSTimer+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


#pragma mark 改变计时器状态
@interface NSTimer (State)

/**
 *  调用NSTime实例暂停定时器
 */
-(void)pauseTimer;

/**
 *  调用NSTime实例恢复定时器
 */
-(void)resumeTimer;

/**
 *  调用NSTime实例在特定时间后恢复定时器
 *
 *  @param interval 多少时间后恢复定时器
 */
-(void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
