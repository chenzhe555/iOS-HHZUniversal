//
//  MCChooseImageView.h
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@protocol MCChooseImageViewDelegate <NSObject>

/**
 *  从相册中选取的照片
 *
 *  @param imageArr 图片数组
 */
-(void)dlGetChoosedImage:(NSArray *)imageArr;

@end

@interface MCChooseImageView : UIView
@property (nonatomic, assign) id<MCChooseImageViewDelegate> delegate;
/**
 *  弹出图片选择视图
 *
 *  @param vc       当前视图控制器
 *  @param delegate
 */
-(void)initChooseImageVC:(UIViewController *)vc andDelegate:(id<MCChooseImageViewDelegate>)delegate;

/**
 *  更新从相册中最多选择图片的个数(默认1张)
 */
-(void)updateMaxChooseImageCount:(NSInteger)count;
@end
