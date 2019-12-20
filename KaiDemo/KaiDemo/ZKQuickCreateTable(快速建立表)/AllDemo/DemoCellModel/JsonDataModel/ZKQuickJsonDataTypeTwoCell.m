//
//  ZKQuickJsonDataTypeTwoCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/17.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickJsonDataTypeTwoCell.h"
#import "ZKQuickJsonDataCellModel.h"
@interface ZKQuickJsonDataTypeTwoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *contentLb;

@end

@implementation ZKQuickJsonDataTypeTwoCell


- (void)setupUI
{
    [super setupUI];
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    ZKQuickJsonDataCellModel *finalModel = (ZKQuickJsonDataCellModel *)model;
    self.titleLb.text = [NSString stringWithFormat:@"标题类型2: %@",finalModel.title];
    self.contentLb.text = [NSString stringWithFormat:@"内容类型2: %@",finalModel.content];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
