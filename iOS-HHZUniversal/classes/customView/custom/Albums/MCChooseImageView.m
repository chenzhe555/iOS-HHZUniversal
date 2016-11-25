//
//  MCChooseImageView.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/23.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCChooseImageView.h"
#import "MCBottmPopView.h"
#import <ZYQAssetPickerController/ZYQAssetPickerController.h>

@interface MCChooseImageView()<ZYQAssetPickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,BasePopViewDelegate>
/**
 *  弹出框的视图控制器
 */
@property (nonatomic, assign) UIViewController * vc;

/**
 *  最多选择的图片数
 */
@property (nonatomic, assign) NSInteger limitChooseCount;
@end

@implementation MCChooseImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _limitChooseCount = 1;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapChooseImageView)]];
    }
    return self;
}

-(void)tapChooseImageView
{
    [[MCBottmPopView shareManager] showPopViewWithTitleArray:@[@"拍照",@"从相机中获取",@"取消"] andColorArray:@[[UIColor whiteColor],[UIColor whiteColor],[UIColor redColor]] andDelegate:self];
}

-(void)initChooseImageVC:(UIViewController *)vc andDelegate:(id<MCChooseImageViewDelegate>)delegate
{
    _vc = vc;
    _delegate = delegate;
}

-(void)updateMaxChooseImageCount:(NSInteger)count
{
    _limitChooseCount = count;
}

#pragma mark BasePopViewDelegate回调
-(void)dlBasePopViewButtonClicked:(NSNumber *)btnTag
{
    UIImagePickerController *picker=[[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = NO;
    [[MCBottmPopView shareManager] stopView];
    switch ([btnTag integerValue]) {
        case 0:
        {
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [_vc presentViewController:picker animated:YES completion:nil];
        }
            break;
        case 1:
        {
            ZYQAssetPickerController * picker = [[ZYQAssetPickerController alloc] init];
            picker.maximumNumberOfSelection = _limitChooseCount;
            picker.assetsFilter = [ALAssetsFilter allPhotos];
            picker.showEmptyGroups = NO;
            picker.delegate = self;
            picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings)
                                      {
                                          if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo])
                                          {
                                              NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
                                              return duration >= 5;
                                          } else
                                          {
                                              return YES;
                                          }
                                      }];
            [_vc presentViewController:picker animated:YES completion:NULL];
        }
            break;
        default:
            break;
    }
}


#pragma mark  ZYQAssetPickerControllerDelegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    NSMutableArray * mutaArr = [NSMutableArray array];
    for (int i = 0; i < assets.count; i++)
    {
        ALAsset * asset = assets[i];
        if ([[[asset.defaultRepresentation.metadata objectForKey:@"{TIFF}"] objectForKey:@"Make"] isEqualToString:@"Apple"])
        {
            [mutaArr addObject:[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage]];
            
        }
        else
        {
            [mutaArr addObject:[UIImage imageWithCGImage:asset.defaultRepresentation.fullResolutionImage]];
        }
    }
    if (_delegate && [_delegate respondsToSelector:@selector(dlGetChoosedImage:)])
    {
        [_delegate performSelector:@selector(dlGetChoosedImage:) withObject:mutaArr];
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSMutableArray * mutaArr = [NSMutableArray array];
    [mutaArr addObject:[info objectForKey:UIImagePickerControllerOriginalImage]];
    if (_delegate && [_delegate respondsToSelector:@selector(dlGetChoosedImage:)])
    {
        [_delegate performSelector:@selector(dlGetChoosedImage:) withObject:mutaArr];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
