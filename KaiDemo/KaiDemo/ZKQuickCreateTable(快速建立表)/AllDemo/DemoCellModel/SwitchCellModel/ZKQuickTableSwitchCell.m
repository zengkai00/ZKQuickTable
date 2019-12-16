//
//  ZKQuickTableSwitchCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableSwitchCell.h"
#import "ZKQuickTableSwitchModel.h"
#import "ZKSwitch.h"
@interface ZKQuickTableSwitchCell()
@property (nonatomic,strong)ZKQuickTableSwitchModel *finalModel;
@property (nonatomic,strong)UIImageView *iconImageView;//图标
@property (nonatomic,strong)UILabel *titleLabel;//标题
@property (nonatomic,strong)UILabel *detailLabel;//详情label
@property (nonatomic,strong)ZKSwitch *zkSwitch;//选择按钮
@property (nonatomic,strong)UIImageView *arraowImage;//箭头

@end
@implementation ZKQuickTableSwitchCell
//-----以下2个方法属于必需实现
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    self.finalModel = (ZKQuickTableSwitchModel *)model;
    self.iconImageView.image = KSys_GetImage(self.finalModel.iconImageName);
    self.titleLabel.text = self.finalModel.titleString;
    self.detailLabel.text = self.finalModel.detailString;
    self.arraowImage.image = KSys_GetImage(self.finalModel.arrowImageName);
    self.zkSwitch.isOn = self.finalModel.isOnSwitch;
}
- (void)setupUI
{
    [super setupUI];
    KSys_WeakSelf;
    self.zkSwitch.switchBlock = ^(BOOL isOn) {
        weakSelf.finalModel.isOnSwitch = isOn;
    };
    //self.bottomLineView.backgroundColor = KColor_Blue;
}
//-----
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView createZKImageViewWithFatherView:self.contentView ImageName:@""];
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.equalTo(self.contentView);
            make.height.width.mas_offset(25);
        }];
    }
    return _iconImageView;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_333333 textAlignment:NSTextAlignmentLeft font:KFont_MainFont(15)];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(10);
            make.top.bottom.mas_equalTo(0);
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
            make.right.equalTo(self.arraowImage.mas_left).offset(-10);
            make.centerY.equalTo(self.arraowImage.mas_centerY);
            make.height.mas_equalTo(24);
            make.width.mas_equalTo(50);
        }];
    }
    return _zkSwitch;
}
- (UIImageView *)arraowImage
{
    if (!_arraowImage) {
        _arraowImage = [UIImageView createZKImageViewWithFatherView:self.contentView ImageName:@"zk_arrow"];
        [_arraowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.mas_equalTo(-12);
            make.height.width.mas_offset(20);
        }];
    }
    return _arraowImage;
}
- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_666666 textAlignment:NSTextAlignmentLeft font:KFont_MainFont(12)];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.titleLabel.mas_leading);
            make.bottom.equalTo(self.titleLabel.mas_bottom).offset(-3);
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
