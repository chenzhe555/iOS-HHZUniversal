//
//  DemoOneCell.m
//  iOS-HHZUniversal
//
//  Created by mc962 on 16/12/7.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "DemoOneCell.h"

@implementation DemoOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)configCellWithTableView:(UITableView *)tableView IndexPath:(NSIndexPath *)indexPath
{
    static NSString * indentifier = @"DemoOneCellIndentifier";
    DemoOneCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[DemoOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.cellIndexPath = indexPath;
    
    return cell;
}

@end
