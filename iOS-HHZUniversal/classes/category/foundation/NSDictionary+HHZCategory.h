//
//  NSDictionary+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//


#pragma mark (Log)用于打印显示utf格式
@interface NSDictionary (Log)
/**
 *  由于服务器返回的打印出来不是UTF-8格式，不易查看，于是重写NSDictionary打印的description方法，打印的时候能很清楚看到中文字符
 *
 *  @param locale
 *
 *  @return
 */
-(NSString *)descriptionWithLocale:(id)locale;
@end

#pragma mark 用于check字典为空的情况
@interface NSMutableDictionary (Checknil)
/**
 *  在可变字典基础上加一层判空
 *
 *  @param anObject 存储的数据
 *  @param aKey     key值
 */
-(void)setMCObject:(id)anObject forKey:(id<NSCopying>)aKey;
@end
