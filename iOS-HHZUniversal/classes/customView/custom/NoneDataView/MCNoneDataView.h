//
//  MCNoneDataView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseNoneDataView.h"

@interface MCNoneDataView : BaseNoneDataView
/**
 *  添加(修改)缺省图片和文字
 *
 *  @param iconImage 显示的图片
 *  @param text      显示的文字
 */
-(void)updateIconImage:(UIImage *)iconImage andText:(NSString *)text;
@end
