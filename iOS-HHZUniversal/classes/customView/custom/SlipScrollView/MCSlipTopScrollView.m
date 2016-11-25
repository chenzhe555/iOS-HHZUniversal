//
//  MCSlipTopScrollView.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCSlipTopScrollView.h"
#import "MCSlipScrollViewDefine.h"
#import "HHZCalculateTool.h"

@implementation MCSlipTopScrollView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style])
    {
        _areaType = MCSlipTopScrollViewItemAreaTypeRegulation;
        _heightArray = [NSMutableArray array];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        _topScrollHeight = 0;
    }
    return self;
}

-(void)setDataArray:(NSMutableArray *)dataArray
{
    _dataArray = dataArray;
    //计算最大宽同时存储宽度
    _maxHeight = [self calculateMaxWidth];
}

-(void)setTopScrollHeight:(CGFloat)topScrollHeight
{
    if (_topScrollHeight != topScrollHeight) {
        _topScrollHeight = topScrollHeight;
        self.frame = CGRectMake(self.x, self.y, self.width, _topScrollHeight);
    }
}


-(CGFloat)calculateMaxWidth
{
    CGFloat maxWidth = 0.0f;
    CGSize labelSize = CGSizeZero;
    for (int i = 0; i < _dataArray.count; i++)
    {
        labelSize = [HHZCalculateTool getLabelActualSizeWithString:[_dataArray objectAtIndex:i] andFont:kTopTitleFont andLines:0 andlabelWidth:SCREENW];
        maxWidth = MAX(labelSize.width, maxWidth);
        [_heightArray addObject:@(labelSize.width + kMCSlideScrollViewDefaultSpace * 2)];
    }
    
    switch (_areaType) {
        case MCSlipTopScrollViewItemAreaTypeRegulation:
        {
            [_heightArray removeAllObjects];
            for (int i = 0; i < _dataArray.count; i++)
            {
                [_heightArray addObject:@(maxWidth + kMCSlideScrollViewDefaultSpace * 2)];
            }
        }
            break;
        case MCSlipTopScrollViewItemAreaTypeByScreenWidth:
        {
            CGFloat width = SCREENW/_dataArray.count;
            [_heightArray removeAllObjects];
            for (int i = 0; i < _dataArray.count; i++)
            {
                [_heightArray addObject:@(width)];
            }
        }
            break;
        default:
            break;
    }
    
    return (maxWidth + kMCSlideScrollViewDefaultSpace * 2);
}




@end
