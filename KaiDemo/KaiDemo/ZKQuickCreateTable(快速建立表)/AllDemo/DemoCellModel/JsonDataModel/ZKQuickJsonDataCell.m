//
//  ZKQuickJsonDataCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/14.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickJsonDataCell.h"
#import "ZKQuickJsonDataCellModel.h"
#import "ZKSwitch.h"
@interface ZKQuickJsonDataCell()
@property (nonatomic,strong)ZKQuickJsonDataCellModel *finalModel;
@property (nonatomic,strong)UILabel *titleLabel;//标题
@property (nonatomic,strong)ZKSwitch *zkSwitch;//选择按钮

@property (nonatomic,strong)UIView *centerLineView;//底部横线
@property (nonatomic,strong)UILabel *detailLabel;//详情label

@end
@implementation ZKQuickJsonDataCell
- (void)setupUI
{
    [super setupUI];
    KSys_WeakSelf;
    self.zkSwitch.switchBlock = ^(BOOL isOn) {
        weakSelf.finalModel.isAnimate = YES;
        weakSelf.finalModel.switchOn = isOn;
        if (isOn) {
            weakSelf.finalModel.cellHeight = ZKQuickJsonData_ClickCellHeight;
        }else
        {
            weakSelf.finalModel.cellHeight = 44;
        }
        weakSelf.finalModel.saveCellHeight = weakSelf.finalModel.cellHeight;
        
        if (weakSelf.finalModel.switchCellBlock) {
            weakSelf.finalModel.switchCellBlock(weakSelf.finalModel);
        }
    };
    self.centerLineView.backgroundColor = KColor_Red;
}
//-----以下2个方法属于必需实现
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    self.finalModel = (ZKQuickJsonDataCellModel *)model;
    self.titleLabel.text = [NSString stringWithFormat:@"标题: %@",self.finalModel.title];
    self.detailLabel.text = [NSString stringWithFormat:@"内容: %@",self.finalModel.content];
    self.zkSwitch.isOn = self.finalModel.switchOn;
    
    if (self.finalModel.switchOn) {
        self.detailLabel.hidden = NO;
        self.centerLineView.hidden = NO;
    }else
    {
        self.detailLabel.hidden = YES;
        self.centerLineView.hidden = YES;
    }
}

//-----
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_333333 textAlignment:NSTextAlignmentLeft font:KFont_MainFont(15)];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(50);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
    }
    return _titleLabel;
}
- (ZKSwitch *)zkSwitch
{
    if (!_zkSwitch) {
        _zkSwitch = [[ZKSwitch alloc] init];
        [self.contentView addSubview:_zkSwitch];
        [_zkSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.equalTo(self.titleLabel.mas_centerY);
            make.height.mas_equalTo(24);
            make.width.mas_equalTo(50);
        }];
    }
    return _zkSwitch;
}
//添加底部分割线
- (UIView *)centerLineView
{
    if (!_centerLineView) {
        _centerLineView = [UIView createZKViewWithFatherView:self.contentView];
        [_centerLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.titleLabel);
            make.width.mas_equalTo(20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
            make.height.mas_equalTo(3);
        }];
    }
    return _centerLineView;
}
- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_666666 textAlignment:NSTextAlignmentLeft font:KFont_MainFont(12)];
        _detailLabel.numberOfLines = 0;
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.titleLabel);
            make.right.mas_equalTo(-10);
            make.top.equalTo(self.centerLineView.mas_bottom).offset(10);
        }];
    }
    return _detailLabel;
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
