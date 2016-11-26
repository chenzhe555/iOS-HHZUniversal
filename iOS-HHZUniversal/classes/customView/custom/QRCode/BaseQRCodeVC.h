//
//  MCQRCodeVC.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface BaseQRCodeVC : UIViewController

/**
 *  中间透明区域坐标
 */
@property (nonatomic, assign) CGRect centerClearRec;

/**
 *  背景颜色
 */
@property (nonatomic, strong) UIColor * bgColor;

/**
 *  开始二维码扫描
 */
-(BOOL)startScaningQRCode;

/**
 *  停止二维码扫描
 */
-(void)stopScaningQRCode;

/**
 *  获取二维码扫描成功得到的字符串
 *
 *  @param successString 扫描的字符串
 */
-(void)handleQRCodeSuccessString:(NSString *)successString;

/**
 *  打开闪光灯
 */
-(void)openFlashLight:(BOOL)openLight;

/**
 *  生成二维码
 *
 *  @param qrString 传入的字符串
 *
 *  @return 
 */
-(UIImage *)createQRImageWithString:(NSString *)qrString;

@end
