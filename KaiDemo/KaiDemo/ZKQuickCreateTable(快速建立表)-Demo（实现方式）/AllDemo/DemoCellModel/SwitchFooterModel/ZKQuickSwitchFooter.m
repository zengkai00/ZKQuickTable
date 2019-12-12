//
//  ZKQuickSwitchFooter.m
//  KaiDemo
//
//  Created by Kai on 2019/12/11.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickSwitchFooter.h"
#import "ZKSwitch.h"
#import "ZKQuickSwitchFooterModel.h"
@interface ZKQuickSwitchFooter()

@property (nonatomic,strong)ZKQuickSwitchFooterModel *currentFooterModel;
@property (nonatomic,strong)UILabel *titleLabel;//标题
@property (nonatomic,strong)ZKSwitch *zkSwitch;//选择按钮

@end

@implementation ZKQuickSwitchFooter

//-----必需实现的继承方法
+ (ZKQuickTableBaseFooter *)footerWithIdentifier:(NSString *)footerIdentifier tableView:(UITableView *)tableView;
{
    ZKQuickSwitchFooter *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerIdentifier];
    if (!footer) {
        footer = [[ZKQuickSwitchFooter alloc] initWithReuseIdentifier:footerIdentifier];
    }
    return footer;
}

- (void)setupUI
{
    [super setupUI];
    KSLog(@"子类的footer创建");
    KSys_WeakSelf;
    self.contentView.backgroundColor = KColor_Cyan;
    self.zkSwitch.switchBlock = ^(BOOL isOn) {
        weakSelf.currentFooterModel.isOnSwitch = isOn;
    };
}

- (void)setFooterDataModel:(ZKQuickTableBaseFooterModel *)footerModel
{
    self.currentFooterModel = (ZKQuickSwitchFooterModel *)footerModel;
    self.titleLabel.text = self.currentFooterModel.titleString;
    self.zkSwitch.isOn = self.currentFooterModel.isOnSwitch;
}

//-------
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_333333 textAlignment:NSTextAlignmentLeft font:KFont_MainFont(15)];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
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
            make.right.mas_equalTo(-10);
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
