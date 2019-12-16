//
//  ZKQuickTextFieldCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/12.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTextFieldCell.h"
#import "ZKQuickTextFieldCellModel.h"
@interface ZKQuickTextFieldCell()

@property (nonatomic,strong)ZKQuickTextFieldCellModel *finalModel;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UITextField *contentTF;

@end

@implementation ZKQuickTextFieldCell

- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    self.finalModel = (ZKQuickTextFieldCellModel *)model;
    self.titleLb.text = self.finalModel.titleString;
    self.contentTF.text = self.finalModel.tfString;
}
- (void)setupUI
{
    [super setupUI];
}

- (IBAction)textfieldDidChange:(UITextField *)sender {
    //KSLog(@"%@",sender.text);
    self.finalModel.tfString = sender.text;
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
