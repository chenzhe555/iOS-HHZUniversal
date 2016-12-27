//
//  HHZAlertView.m
//  iOS-HHZUniversal
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZAlertView.h"

@implementation HHZAlertView


+(void)showAlertViewTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate ButtonTitles:(NSArray *)otherButtonTitles Tag:(NSInteger)tag
{
    [self showAlertTitle:title message:message delegate:delegate ButtonTitles:otherButtonTitles Tag:tag];
}

//iOS8以前用的弹框(无返回值)
+(void)showAlertNoneReturnTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate ButtonTitles:(NSArray *)otherButtonTitles Tag:(NSInteger)tag
{
    [self showAlertTitle:title message:message delegate:delegate ButtonTitles:otherButtonTitles Tag:tag];
}

//iOS8以前用的弹框(有返回值)
+(UIAlertView *)showAlertTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate ButtonTitles:(NSArray *)otherButtonTitles Tag:(NSInteger)tag
{
    UIAlertView * alert= nil;
    if (otherButtonTitles.count > 1)
    {
        NSMutableString * btnTitles = [[NSMutableString alloc] init];
        for (int i = 1; i < otherButtonTitles.count; i++)
        {
            if(i == (otherButtonTitles.count - 1))
            {
                [btnTitles appendFormat:@"%@",otherButtonTitles[i]];
            }
            else
            {
                [btnTitles appendFormat:@"%@,",otherButtonTitles[i]];
            }
            
        }
        NSString * showTitles = [btnTitles substringToIndex:(btnTitles.length - 1)];
        alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:otherButtonTitles[0] otherButtonTitles:showTitles, nil];
    }
    else
    {
        alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:otherButtonTitles[0] otherButtonTitles: nil];
    }
    alert.tag = tag;
    [alert show];
    return alert;
}

//iOS8以后弹框(无返回值)
+(void)showAlertControllerNoneReturnTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate ButtonTitles:(NSArray *)otherButtonTitles Tag:(NSInteger)tag
{
    [self showAlertControllerTitle:title message:message delegate:delegate ButtonTitles:otherButtonTitles Tag:tag];
}


//iOS8以后弹框(有返回值)
+(UIAlertController *)showAlertControllerTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate ButtonTitles:(NSArray *)otherButtonTitles Tag:(NSInteger)tag
{
    UIAlertController * alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < otherButtonTitles.count; i++)
    {
        UIAlertAction * aAction = [UIAlertAction actionWithTitle:otherButtonTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (delegate && [delegate respondsToSelector:@selector(dlMCAlertView:clickedButtonAtIndex:)])
            {
                [delegate dlMCAlertView:alertC clickedButtonAtIndex:i];
            }
        }];
        [alertC addAction:aAction];
    }
    
    [((UIViewController *)delegate) presentViewController:alertC animated:YES completion:nil];
    return alertC;
}

@end
