//
//  HHZDateTool.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@interface HHZDateTool : NSObject
@property (nonatomic, strong) NSDateFormatter * fommat;

/**
 *  获取DateFormmater实例
 *
 *  @return
 */
+(instancetype)shareDateFommat;

/**
 *  提供Date对象获取时间字符串
 *
 *  @param date
 *
 *  @return
 */
-(NSString *)getStringFromDate:(NSDate *)date;

/**
 *  提供时间字符串获取Date对象
 *
 *  @param dateString
 *
 *  @return
 */
-(NSDate *)getDateFromString:(NSString *)dateString;




/**
 *  获取当前时区时间戳
 *
 *  @return
 */
+(NSTimeInterval)getCurrentZoneInterval;

/**
 *  获取当前时间戳
 *
 *  @return 
 */
+(NSTimeInterval)getTimeStamp;

@end