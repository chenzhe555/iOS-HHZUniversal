//
//  SDWebImageDownloaderOperation+HHZCategory.h
//  iOS-HHZUniversal
//
//  Created by 陈哲是个好孩子 on 16/12/15.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDWebImage/SDWebImageDownloaderOperation.h>

@interface SDWebImageDownloaderOperation (AddDomain)
/**
 *  允许加载证书的网站
 */
@property (nonatomic, strong) NSArray * hhz_AllowDomainsArray;
@end
