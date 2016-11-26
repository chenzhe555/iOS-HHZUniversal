//
//  BaseNaviView.h
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/3/1.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//文字基本信息
#define kBaseNaviViewTitleNormalColor    [UIColor lightGrayColor]
#define kBaseNaviViewTitleSelectedColor  [UIColor redColor]
#define kBaseNaviViewTitleFont            14

//左右间隙
#define kBaseNaviViewHaveImageSpace     10             //有图片时候的间隙
#define kBaseNaviViewOnlyTitleOrImageSpace     15      //只有图片时候的间隙
#define kBaseNaviViewTitleAndImageSpace     5          //图片和文字的间隙

typedef NS_ENUM (NSInteger, BaseNaviViewShowType) {
    BaseNaviViewShowTypeTitleLeft = 101,               //文字左(如果没有图片、居中)
    BaseNaviViewShowTypeTitleRight,                    //文字右(如果没有图片、居中)
    BaseNaviViewShowTypeTitleBottom,                   //文字底部(如果没有图片、居中)
    BaseNaviViewShowTypeTitleTop,                      //文字顶部(如果没有图片、居中)
};


@interface BaseNaviView : UIView
/**
 *  创建Navi视图(必须先设置BaseNaviView的frame)
 *
 *  @param title         文字
 *  @param normalImage   正常情况下图片
 *  @param selectedImage 选中下图片
 *  @param type          显示类型
 *
 *  @return
 */
-(void)createNaviView:(NSString *)title NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage ShowType:(BaseNaviViewShowType)type;
@end
























@interface NaviImageView : UIImageView
/**
 *  正常图片
 */
@property (nonatomic, strong) UIImage * normalImage;
/**
 *  选中后的图片
 */
@property (nonatomic, strong) UIImage * selectedImage;
/**
 *  是否被选中
 */
@property (nonatomic, assign) BOOL isSelect;
@end