//
//  MCSlipScrollView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "MCSlipScrollView.h"
#import "MCSlipTopItemCell.h"
#import "MCSlipScrollViewDefine.h"
#import "UIView+HHZCategory.h"

@interface MCSlipScrollView()<UITableViewDelegate,UITableViewDataSource>
/**
 *  滚动高亮显示的View
 */
@property (nonatomic, strong) UIView * highlightView;

/**
 *  当前顶部视图选中的Cell
 */
@property (nonatomic, strong) MCSlipTopItemCell * currentCell;

/**
 *  当前选择的索引
 */
@property (nonatomic, assign) NSInteger selectedIndex;


#pragma mark 判断滑动到左边还是右边
/**
 *  手放上去之后的x值
 */
@property (nonatomic, assign) CGFloat beginContentOffsetX;

/**
 *  方向值判断 0-none 1-left 2-right
 */
@property (nonatomic, assign) NSInteger isRightLeftOrNone;
@end

@implementation MCSlipScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认什么都没有
        _fillType = MCSlipTopScrollViewItemFillTypeNone;
        _isRightLeftOrNone = 0;
    }
    return self;
}

-(void)setIsHaveTopScroll:(BOOL)isHaveTopScroll
{
    if (_bottomScrollView) {
        return;
    }
    _isHaveTopScroll = isHaveTopScroll;
    if(_isHaveTopScroll) {
        //添加顶部视图
        self.topScrollView = [[MCSlipTopScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 40) style:UITableViewStylePlain];
        self.topScrollView.topScrollHeight = 40;
        [self addSubview:self.topScrollView];
        
        //添加额外效果的滚动视图
        _highlightView = [[UIView alloc] init];
        _highlightView.backgroundColor = kTopScrollViewCoverColor;
        _highlightView.alpha = 0.5f;
        [self.topScrollView addSubview:_highlightView];
        
        self.topScrollView.dataArray = [self.delegate mcSlipScrollViewTopTitleArray:self.topScrollView];
        
        [self createSlipScrollView];
    }
    
    [self createBottomMainScrollView];
    
}

-(void)setFillType:(MCSlipTopScrollViewItemFillType)fillType
{
    _fillType = fillType;
    if (fillType == MCSlipTopScrollViewItemFillTypeFill)
    {
        _highlightView.layer.cornerRadius = 5.0f;
        _highlightView.layer.masksToBounds = YES;
    }
}

#pragma mark 创建视图
-(void)createSlipScrollView
{
    //创建顶部滚动文字的视图
    self.topScrollView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    self.topScrollView.frame = CGRectMake(0, 0, self.width,self.topScrollView.topScrollHeight);
    
    self.topScrollView.delegate = self;
    self.topScrollView.dataSource = self;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _selectedIndex = 0;
        _currentCell = [self.topScrollView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    });
}

-(void)createBottomMainScrollView
{
    //添加顶部视图
    if (self.topScrollView)
    {
        self.bottomScrollView = [[MCSlipMainScrollView alloc] initWithFrame:CGRectMake(self.topScrollView.x, self.topScrollView.y + self.topScrollView.height, self.width, self.height - self.topScrollView.topScrollHeight) style:UITableViewStylePlain];
    }
    else
    {
        self.bottomScrollView = [[MCSlipMainScrollView alloc] initWithFrame:CGRectMake(0.05, 0.05, self.width, self.height) style:UITableViewStylePlain];
    }
    
    [self addSubview:self.bottomScrollView];
    
    self.bottomScrollView.viewsArray = [self.delegate mcSlipScrollViewBottomViewArray:self.bottomScrollView];
    
    //创建顶部滚动文字的视图
    self.bottomScrollView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    if (self.topScrollView)
    {
        self.bottomScrollView.frame = CGRectMake(self.topScrollView.x, self.topScrollView.y + self.topScrollView.height, self.width,self.height - self.topScrollView.topScrollHeight);
    }
    else
    {
        self.bottomScrollView.frame = CGRectMake(0.05, 0.05, self.width,self.height);
    }
    
    self.bottomScrollView.delegate = self;
    self.bottomScrollView.dataSource = self;
}

#pragma mark 自定义事件
#pragma mark ------处理点击后顶部cell的变化
-(void)handleCellSelectedStateIndexPath:(NSIndexPath *)indexPath
{
    MCSlipTopItemCell * cell = [_topScrollView cellForRowAtIndexPath:indexPath];
    //第一次switch的时候current没值
    if (_currentCell == nil)
    {
        _currentCell = [_topScrollView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
    }
    if (![_currentCell isEqual:cell])
    {
        CGRect rect = CGRectZero;
        //文字本来的宽度
        CGFloat labelWidth = self.topScrollView.maxHeight - kMCSlideScrollViewDefaultSpace*2;
        _currentCell.isSelected = NO;
        _currentCell = cell;
        _selectedIndex = indexPath.row;
        if (_fillType == MCSlipTopScrollViewItemFillTypeNone)
        {
            [cell titleShowAnimate];
        }
        else
        {
            switch (_fillType) {
                case MCSlipTopScrollViewItemFillTypeLine:
                {
                    rect = CGRectMake(0, cell.y + (cell.height - labelWidth)/2, 2, labelWidth);
                }
                    break;
                case MCSlipTopScrollViewItemFillTypeFill:
                {
                    
                    rect = CGRectMake((cell.width - cell.titleLabel.height - 3*2)/2, cell.y + (cell.height - labelWidth)/2 - 5,cell.titleLabel.height + 3*2, labelWidth + 5*2);
                }
                    break;
                case MCSlipTopScrollViewItemFillTypeTotalFill:
                {
                    rect = CGRectMake(0, cell.y, cell.width, cell.height);
                }
                    break;
                default:
                    break;
            }
            _currentCell.isSelected = YES;
            [UIView animateWithDuration:0.3f animations:^{
                _highlightView.frame = rect;
            } completion:^(BOOL finished) {
                
            }];
        }
        
    }
    
}

-(void)switchTopScrollToIndex:(NSInteger)scrollIndex
{
    if (scrollIndex < self.topScrollView.dataArray.count) {
        _currentCell.isSelected = NO;
        _selectedIndex = scrollIndex;
        _currentCell = [self.topScrollView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:scrollIndex inSection:0]];
        _currentCell.isSelected = YES;
        [_topScrollView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    }
    
}

-(void)switchBottomScrollToIndex:(NSInteger)scrollIndex
{
    if (scrollIndex < self.bottomScrollView.viewsArray.count) {
        _selectedIndex = scrollIndex;
        [self.delegate mcSlipViewBottomViewScroll:self.bottomScrollView.viewsArray[scrollIndex] index:scrollIndex];
        [self.bottomScrollView setContentOffset:CGPointMake(self.bottomScrollView.contentOffset.x, scrollIndex * self.bottomScrollView.width) animated:YES];
    }
    
}


#pragma mark UITableView回调方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_topScrollView])
    {
        return self.topScrollView.dataArray.count;
    }
    else
    {
        return self.bottomScrollView.viewsArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.topScrollView])
    {
        MCSlipTopItemCell * cell = [MCSlipTopItemCell configCellWithTableView:tableView];
        cell.titleLabel.text = self.topScrollView.dataArray[indexPath.row];
        cell.titleLabel.frame = CGRectMake(([self.topScrollView.heightArray[indexPath.row] floatValue] - cell.titleLabel.width)/2, (self.topScrollView.topScrollHeight - cell.titleLabel.height)/2, cell.titleLabel.width, cell.titleLabel.height);
        if (_selectedIndex == indexPath.row)
        {
            cell.isSelected = YES;
        }
        else
        {
            cell.isSelected = NO;
        }
        return cell;
    }
    else if ([tableView isEqual:self.bottomScrollView])
    {
        static NSString * bottomScrollViewCellIdentifier = @"bottomScrollViewCellIdentifier";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:bottomScrollViewCellIdentifier];
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bottomScrollViewCellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            cell.transform = CGAffineTransformMakeRotation(M_PI_2);
        }
        [cell.contentView addSubview:((UIViewController *)self.bottomScrollView.viewsArray[indexPath.row]).view];
        return cell;
    }
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_topScrollView])
    {
        [self handleCellSelectedStateIndexPath:indexPath];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.topScrollView])
    {
        return [self.topScrollView.heightArray[indexPath.row] floatValue];
    }
    else if ([tableView isEqual:self.bottomScrollView])
    {
        return self.width;
    }
    return 0.01;
}

#pragma mark scrollDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.bottomScrollView])
    {
        self.beginContentOffsetX = scrollView.contentOffset.y;
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.bottomScrollView])
    {
        if (self.beginContentOffsetX - scrollView.contentOffset.y > scrollView.frame.size.width/2)
        {
            self.isRightLeftOrNone = 1;
        }
        else if(self.beginContentOffsetX - scrollView.contentOffset.y < -scrollView.frame.size.width/2)
        {
            self.isRightLeftOrNone = 2;
        }
        else
        {
            self.isRightLeftOrNone = 0;
        }
    }
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.bottomScrollView])
    {
        switch (self.isRightLeftOrNone)
        {
            case 0:
            {
                
            }
                break;
            case 1:
            {
                if (_selectedIndex > 0) {
                    NSInteger index = _selectedIndex - 1;
                    [self switchBottomScrollToIndex:index];
                    [self switchTopScrollToIndex:index];
                }
            }
                break;
            case 2:
            {
                if (_selectedIndex < self.bottomScrollView.viewsArray.count) {
                    NSInteger index = _selectedIndex + 1;
                    [self switchBottomScrollToIndex:index];
                    [self switchTopScrollToIndex:index];
                }
            }
                break;
            default:
                break;
        }
    }
    
}



@end
