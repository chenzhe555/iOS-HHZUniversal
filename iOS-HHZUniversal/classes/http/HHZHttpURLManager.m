//
//  HHZHttpURLManager.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/29.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpURLManager.h"

@interface HHZHttpURLManager()
/**
 *  存放URL地址的字典
 */
@property (nonatomic, strong) NSMutableDictionary * urlDic;

@end

@implementation HHZHttpURLManager
+(instancetype)shareManager
{
    static HHZHttpURLManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HHZHttpURLManager alloc] init];
    });
    return manager;
}

-(instancetype)init
{
    if (self = [super init]) {
        self.urlDic = [[NSMutableDictionary alloc] init];
        
        /**
         *  1.先从缓存中读取请求地址
         */
        NSDictionary * dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"serviceURLDictionary"];
        if (!dic && (dic.allKeys.count != 0)) {
            for(NSString * key in dic) {
                [self.urlDic setObject:dic[key] forKey:key];
            }
        }
        
        /**
         *  2.然后再在本地设置请求地址们.
         */
        [self pushURL:[self getCommonComleteURL:@"/chenzhe/test"] Key:@"testUrl"];
    }
    return self;
}

-(NSString *)getComleteURL:(NSString *)domain Suffix:(NSString *)suffix
{
    return [NSString stringWithFormat:@"%@%@",domain,suffix];
}

-(NSString *)getCommonComleteURL:(NSString *)suffix
{
    return [NSString stringWithFormat:@"%@%@",@"https://chenzhe.com",suffix];
}

-(void)pushURL:(NSString *)httpURL Key:(NSString *)key
{
    //如果已经有相应的Key值存在，则不赋值
    if (![self.urlDic.allKeys containsObject:key]) {
        [self.urlDic setObject:httpURL forKey:key];
    }
}

-(void)setHttpRequestURL:(NSDictionary *)dic
{
    if (!dic && (dic.allKeys.count != 0)) {
        for(NSString * key in dic) {
            [self.urlDic setObject:dic[key] forKey:key];
        }
        
        //暂时先用UserDefaults缓存下.
        [[NSUserDefaults standardUserDefaults] setObject:self.urlDic.mutableCopy forKey:@"serviceURLDictionary"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}






-(NSString *)getTestUrl
{
    return self.urlDic[@"testUrl"];
}




@end
