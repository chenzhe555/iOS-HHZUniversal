//
//  NSString+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#pragma mark 用于一些基本字符串值的验证
@interface NSString (Verify)
/**
 *  转换对象为字符串，如果obj为空，则返回 @""
 *
 *  @param obj 传入的不确定值
 *
 *  @return
 */
+(NSString *)transformStringWithObj:(id)obj;
@end


#pragma mark 用于JSON与字符串的转换
@interface NSString (JSONValue)

/**
 *  通过传入JSON对象转换返回Data对象,转换失败返回nil
 *
 *  @param jsonObj JSON对象
 *
 *  @return
 */
+(NSData *)JSONDataWithJSONObj:(id)jsonObj;

/**
 *  通过当前JSON字符串转换返回id(Data)类型，转换失败返回nil
 *
 *  @return
 */
-(id)JSONIdWithJSONString;

@end

#pragma mark 对部分字体进行颜色、字体改变
@interface NSString (AttributString)
/**
 *  对文本特定range进行颜色color和字体font的改变
 *
 *  @param font  改变的字体
 *  @param color 改变的颜色
 *  @param range 改变的range
 *
 *  @return
 */
-(NSMutableAttributedString *)addCustomAttributeFont:(UIFont *)font andColor:(UIColor *)color andRange:(NSRange)range;

/**
 *  对特定文字searchText所有地方进行颜色color和字体font的改变
 *
 *  @param font       改变的字体
 *  @param color      改变的颜色
 *  @param searchText 改变的range
 *
 *  @return
 */
-(NSMutableAttributedString *)addCustomAttributeFont:(UIFont *)font andColor:(UIColor *)color andText:(NSString *)searchText;

/**
 *  对特定字符串添加下划线
 *
 *  @param color 下划线颜色
 *
 *  @return
 */
-(NSMutableAttributedString *)addLineAttributerWithTextWithColor:(UIColor *)color;

/**
 *  对字符串的特定Range添加下划线
 *
 *  @param range 要改变的range
 *  @param color 下划线颜色
 *
 *  @return
 */
-(NSMutableAttributedString *)addLineAttributerWithRange:(NSRange)range andColor:(UIColor *)color;
@end

#pragma mark 通过类名获取类
@interface NSString (ClassBuild)

-(Class)getObjClass;

@end

