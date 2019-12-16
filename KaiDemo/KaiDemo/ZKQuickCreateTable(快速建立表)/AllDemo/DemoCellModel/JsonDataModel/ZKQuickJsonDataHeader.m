//
//  ZKQuickJsonDataHeader.m
//  KaiDemo
//
//  Created by Kai on 2019/12/14.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickJsonDataHeader.h"
#import "ZKSwitch.h"
#import "ZKQuickJsonDataHeaderModel.h"
@interface ZKQuickJsonDataHeader()
@property (nonatomic,strong)ZKQuickJsonDataHeaderModel *currentHeaderModel;
@property (nonatomic,strong)UILabel *numberLabel;//数字
@property (nonatomic,strong)UILabel *titleLabel;//标题
@property (nonatomic,strong)ZKSwitch *zkSwitch;//选择按钮

@end
@implementation ZKQuickJsonDataHeader

//必需实现的方法
- (void)setupUI
{
    [super setupUI];
    self.contentView.backgroundColor = KColor_White;
    KSys_WeakSelf;
    self.numberLabel.layer.cornerRadius = 6;
    self.numberLabel.layer.masksToBounds = YES;
    self.numberLabel.backgroundColor = KColor_Cyan;
    self.zkSwitch.switchBlock = ^(BOOL isOn) {
        weakSelf.currentHeaderModel.sectionSwitchOn = isOn;
        if (weakSelf.currentHeaderModel.switchHeaderBlock) {
            weakSelf.currentHeaderModel.switchHeaderBlock(weakSelf.currentHeaderModel);
        }
    };
}

- (void)setHeaderDataModel:(ZKQuickTableBaseHeaderModel *)headerModel
{
    [super setHeaderDataModel:headerModel];
    self.currentHeaderModel = (ZKQuickJsonDataHeaderModel *)headerModel;
    self.numberLabel.text = self.currentHeaderModel.number;
    self.titleLabel.text = self.currentHeaderModel.sectionTitle;
    self.zkSwitch.isOn = self.currentHeaderModel.sectionSwitchOn;
}

//-------
- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_666666 textAlignment:NSTextAlignmentCenter font:KFont_MainFont(15)];
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.width.height.mas_equalTo(30);
        }];
    }
    return _numberLabel;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_333333 textAlignment:NSTextAlignmentLeft font:KFont_MainFont(15)];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numberLabel.mas_right).offset(10);
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
            make.left.equalTo(self.titleLabel.mas_right).offset(10);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.height.mas_equalTo(24);
            make.width.mas_equalTo(50);
        }];
    }
    return _zkSwitch;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
