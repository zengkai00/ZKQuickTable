//
//  ZKQuickTableTextCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/6.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableTextCell.h"
#import "ZKQuickTableTextModel.h"
@interface ZKQuickTableTextCell()

@property (nonatomic,strong)UIImageView *iconImageView;//图标
@property (nonatomic,strong)UILabel *titleLabel;//标题
@property (nonatomic,strong)UILabel *detailLabel;//详情label
@property (nonatomic,strong)UIImageView *arraowImage;//箭头

@end

@implementation ZKQuickTableTextCell
//-----以下2个方法属于必需实现
+ (ZKQuickTableBaseCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
{
    ZKQuickTableTextCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[ZKQuickTableTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    ZKQuickTableTextModel *finalModel = (ZKQuickTableTextModel *)model;
    if (finalModel.iconImageName.length <= 0 || finalModel.arrowImageName.length <= 0) {
        KSLog(@"图片没名字");
    }
    self.iconImageView.image = KSys_GetImage(finalModel.iconImageName);
    self.titleLabel.text = finalModel.titleString;
    self.detailLabel.text = finalModel.detailString;
    self.arraowImage.image = KSys_GetImage(finalModel.arrowImageName);
}

//------
- (void)setupUI
{
    [super setupUI];
    //self.bottomLineView.backgroundColor = KColor_Blue;
}
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
        _detailLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_666666 textAlignment:NSTextAlignmentRight font:KFont_MainFont(12)];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arraowImage.mas_left).offset(-10);
            make.top.bottom.mas_equalTo(0);
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
