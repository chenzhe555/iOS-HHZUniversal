//
//  NSArray+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 (Log)用于打印显示utf格式
 */
@interface NSArray (Log)
/**
 *  由于服务器返回的打印出来不是UTF-8格式，不易查看，于是重写NSArray打印的description方法，打印的时候能很清楚看到中文字符
 *
 *
 *  @param locale
 *
 *  @return
 */
-(NSString *)descriptionWithLocale:(id)locale;

@end
