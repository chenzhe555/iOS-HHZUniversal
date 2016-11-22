//
//  HHZHttpClient.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZHttpClient.h"


@implementation HHZHttpClient
+(HHZHttpResult *)sendRequest:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition success:(HHZSuccessBlock)success fail:(HHZFailureBlock)fail
{
    //生成Tag唯一标识
    NSUInteger httpTag = [[HHZHttpTagBuilder shareManager] getSoleHttpTag];
    //添加附加请求参数
    [self addExtraParamatersWithCondition:request];
#if DEBUG
    NSLog(@"<网络请求(加密前):%lu>\n%@\n",(long)httpTag,request.paramaters);
#endif
    //对参数加密
    [self encryptionRequest:request];
#if DEBUG
    NSLog(@"<网络请求(加密后):%lu>\n%@\n",(long)httpTag,request.paramaters);
#endif
   
    
    //处理Condition情况
    [self handleHttpCondition:condition];
    
    NSURLSessionDataTask * getTask = nil;
    if ([request.requestMethod isEqualToString:@"POST"]) {
        getTask = [[AFHTTPSessionManager manager] POST:request.url parameters:request.paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
            reponse.object = responseObject;
            reponse.tag = httpTag;
            reponse.requestUrl = request.url;
            reponse.alertType = condition.alertType;
            
            if (success)
            {
                success(reponse);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HHZHttpResponse * reponse = [[HHZHttpResponse alloc] init];
            reponse.errorInfo = error;
            reponse.tag = httpTag;
            reponse.requestUrl = request.url;
            reponse.alertType = condition.alertType;
            
            if (fail)
            {
                fail(reponse);
            }
        }];
    }
    return [HHZHttpResult generateDefaultResult:httpTag];
}

+(void)addExtraParamatersWithCondition:(HHZHttpRequest *)request
{
    [request.paramaters setObject:[HHZDeviceTool getCurrentVersion] forKey:@"kAppVersion"];
    [request.paramaters setObject:[HHZDeviceTool getPhoneType] forKey:@"kPhoneType"];
    [request.paramaters setObject:[HHZDeviceTool getDeviceSystemVersion] forKey:@"kPhoneVersion"];
    [request.paramaters setObject:@"iOS" forKey:@"kChannel"];
}

+(void)encryptionRequest:(HHZHttpRequest *)request
{
    switch (request.encryptionType) {
        case HHZEncryptionTypeMall:
        {
            request.paramaters = [HHZHttpEncryption encrytionParameterMethod1:request.paramaters privateKeyArray:[HHZHttpEncryption setMethod1ParametersArray] AESKey:[HHZHttpEncryption setMethod1AESKey]];
        }
            break;
        case HHZEncryptionTypeXiaoMei:
        {
            request.paramaters = [HHZHttpEncryption encrytionParameterMethod1:request.paramaters privateKeyArray:[HHZHttpEncryption setMethod1ParametersArray]];
        }
            break;
        default:
            break;
    }
}

+(void)handleHttpCondition:(HHZHttpRequestCondition *)condition
{
    switch (condition.serializerType) {
        case HHZHttpSerializerType1: {
            [AFHTTPSessionManager manager].requestSerializer = [AFJSONRequestSerializer serializer];
            [AFHTTPSessionManager manager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType2: {
            [AFHTTPSessionManager manager].requestSerializer = [AFJSONRequestSerializer serializer];
            [AFHTTPSessionManager manager].responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType3: {
            [AFHTTPSessionManager manager].requestSerializer = [AFHTTPRequestSerializer serializer];
            [AFHTTPSessionManager manager].responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        }
        case HHZHttpSerializerType4: {
            [AFHTTPSessionManager manager].requestSerializer = [AFHTTPRequestSerializer serializer];
            [AFHTTPSessionManager manager].responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        }
        default:
            break;
    }
}
@end
