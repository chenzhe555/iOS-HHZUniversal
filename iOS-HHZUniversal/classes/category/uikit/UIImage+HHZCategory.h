//
//  UIImage+HHZCategory.h
//  iOS_Universal_Project
//
//  Created by chenzhe.376811578@qq.com on 16/11/19.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

@interface UIImage (ImageEffects)

#pragma mark ImageEffects
// 模糊效果(渲染很耗时间,建议在子线程中渲染)
- (UIImage *)blurImage;
- (UIImage *)blurImageWithMask:(UIImage *)maskImage;
- (UIImage *)blurImageWithRadius:(CGFloat)radius;
- (UIImage *)blurImageAtFrame:(CGRect)frame;

// 灰度效果
- (UIImage *)grayScale;

// 固定宽度与固定高度
- (UIImage *)scaleWithFixedWidth:(CGFloat)width;
- (UIImage *)scaleWithFixedHeight:(CGFloat)height;

// 平均的颜色
- (UIColor *)averageColor;

// 裁剪图片的一部分
- (UIImage *)croppedImageAtFrame:(CGRect)frame;

// 将自身填充到指定的size
- (UIImage *)fillClipSize:(CGSize)size;

@end


#pragma mark 获取bundle里面图片信息
@interface UIImage (Bundle)
/**
 *  获取当前App的Icon图片Image对象
 *
 *  @return
 */
+(UIImage *)getAppIcon;
@end


#pragma mark 对图片进行压缩大小，拉伸，离屏渲染等等操作
@interface UIImage (Transform)

/**
 *  压缩当前图片Image成指定大小Image
 *
 *  @param size 指定尺寸
 */
-(UIImage *)compressToSize:(CGSize)size;

/**
 *  根据传入的图片最大宽高参数，计算出图片容器的Size
 *
 *  @param image 传入的图片
 *
 *  @return
 */
-(CGSize)getContainerSizeWithLimitWidth:(CGFloat)limitWidth andLimitHeight:(CGFloat)limitHeight;

/**
 *  拉伸Image矩形范围内视图(仅拉伸区域内，类型QQ聊天框)
 *
 *  @param edgeInset 指定矩形区域
 *
 *  @return
 */
-(UIImage *)resizeImageWithEdge:(UIEdgeInsets)edgeInset;

/**
 *  传入颜色对象获取纯色Image对象
 *
 *  @param color 颜色值
 *
 *  @return
 */
+(UIImage *)transformToPureImageWithColor:(UIColor *)color;


-(UIImage*)imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  设置Image的圆角，避免离屏渲染
 *
 *  @param radius 圆角
 *  @param size
 *
 *  @return
 */
-(UIImage *)imageWithCornerRadius:(CGFloat)radius Size:(CGSize)size;

@end