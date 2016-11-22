//
//  ServiceDemo.m
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/18.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "ServiceDemo.h"

@implementation ServiceDemo
-(void)manageServiceSuccess:(HHZHttpResponse *)responseObject
{
#if DEBUG
    NSLog(@"<服务器返回参数:%lu>\n%@\n",(unsigned long)responseObject.tag,responseObject.requestUrl);
#endif
    
    NSString * codeStr = [NSString stringWithFormat:@"%@",[((HHZHttpResponse *)responseObject).object objectForKey:@"ret"]];
    if ([codeStr isEqualToString:@"1"])
    {
        //用于服务器数据本地化,可用于缓存
        //        NSData * jsonData = [NSJSONSerialization dataWithJSONObject:responseObject.object options:NSJSONWritingPrettyPrinted error:nil];
        //        NSString * jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //        这里有个basePath地址，由于敏感，替代.
        //       NSString * basePath = @"/U/mc/Desktop/gs/nishuo/项目/项目/项目下面JSON";
        //
        //        NSArray * arr = [responseObject.requestUrl componentsSeparatedByString:@".com"];
        //        if (arr.count == 2)
        //        {
        //            NSArray * arr2 = [arr[1] componentsSeparatedByString:@"/"];
        //            NSMutableString * mutaStr = [[NSMutableString alloc] init];
        //            for (int i = 0; i < arr2.count; i++)
        //            {
        //                [mutaStr appendString:arr2[i]];
        //            }
        //            if (mutaStr.length > 0)
        //            {
        //                NSString * filePath = [NSString stringWithFormat:@"%@/%@",basePath,mutaStr];
        //                [jsonString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        //            }
        //        }
        
        if(self.serviceDelegate && [self.serviceDelegate respondsToSelector:@selector(requestSuccess:)])
        {
            [self.serviceDelegate performSelector:@selector(requestSuccess:) withObject:responseObject];
        }
    }
    else
    {
        ((HHZHttpResponse *)responseObject).isRequestSuccessFail = YES;
        if (self.serviceDelegate && [self.serviceDelegate respondsToSelector:@selector(requestFail:)])
        {
            [self.serviceDelegate performSelector:@selector(requestFail:) withObject:responseObject];
        }
    }

}

-(void)manageServiceFail:(HHZHttpResponse *)responseObject
{
    responseObject.isRequestSuccessFail = NO;
    if (self.serviceDelegate && [self.serviceDelegate respondsToSelector:@selector(requestFail:)])
    {
        [self.serviceDelegate performSelector:@selector(requestFail:) withObject:responseObject];
    }
}

-(void)handleFailInfo:(HHZHttpResponse *)responeseObject
{
    if (responeseObject.isRequestSuccessFail)
    {
        [self handleHttpSuccessErrorInfo:responeseObject];
    }
    else
    {
        [self handleHttpFailInfo:responeseObject];
    }
}


#pragma mark 处理网络请求的弹框形式
-(void)handleHttpSuccessErrorInfo:(HHZHttpResponse *)response
{
    [self showError:[NSString stringWithFormat:@"%@",[[response.object objectForKey:@"error"] objectForKey:@"msg"]] andErrorCode:[NSString stringWithFormat:@"%@",[[response.object objectForKey:@"error"] objectForKey:@"code"]] andErrorType:response.alertType];
}

-(void)handleHttpFailInfo:(HHZHttpResponse *)response
{
    [self showError:@"网络不给力,请稍候重试" andErrorCode:@"000000" andErrorType:response.alertType];
}


-(void)showError:(NSString *)errorStr andErrorCode:(NSString *)errorCode andErrorType:(HHZHttpAlertType)type
{
    switch (type)
    {
        case HHZHttpAlertTypeNone:
        {
            //不做任何处理
        }
            break;
        case HHZHttpAlertTypeNative:
        {
            //弹系统原生的框
        }
            break;
        case HHZHttpAlertTypeToast:
        {
            //弹安卓风格的Toast框
        }
            break;
            
        default:
            break;
    }
}
@end
