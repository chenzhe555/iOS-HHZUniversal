//
//  HHZArchiveTool.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HHZArchiveTool : NSObject
/**
 *  传入能进行归档的对象data写入指定的地址path
 *
 *  @param path 存储路径
 *  @param data 数据
 */
+(BOOL)writeDataToFile:(NSString *)path data:(id)data;

/**
 *  从某个地址path下解档获取对象
 *
 *  @param path 数据路径
 *
 *  @return
 */
+(id)getDataFromFile:(NSString *)path;
@end
