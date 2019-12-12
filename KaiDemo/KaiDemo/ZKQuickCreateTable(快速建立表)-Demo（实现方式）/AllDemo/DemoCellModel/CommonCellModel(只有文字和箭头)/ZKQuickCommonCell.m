//
//  ZKQuickCommonCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/6.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickCommonCell.h"
#import "ZKQuickCommonModel.h"
@interface ZKQuickCommonCell()

@property (nonatomic,strong)UILabel *titleLabel;//标题
@property (nonatomic,strong)UIImageView *arraowImage;//箭头

@end
@implementation ZKQuickCommonCell

//-----以下2个方法属于必需实现
+ (ZKQuickTableBaseCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
{
    ZKQuickCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[ZKQuickCommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    ZKQuickCommonModel *finalModel = (ZKQuickCommonModel *)model;
    self.titleLabel.text = finalModel.titleString;
    self.arraowImage.image = KSys_GetImage(finalModel.arrowImageName.length > 0 ?finalModel.arrowImageName:@"zk_arrow");
}

//------
- (void)setupUI
{
    [super setupUI];
    //self.bottomLineView.backgroundColor = KColor_Blue;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel createZKLabelWithFatherView:self.contentView textColor:KColor_666666 textAlignment:NSTextAlignmentLeft font:KFont_MainFont(15)];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
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
            make.left.equalTo(self.titleLabel.mas_right).offset(10);
            make.centerY.equalTo(self.contentView);
            make.right.mas_equalTo(-12);
            make.height.width.mas_offset(20);
        }];
    }
    return _arraowImage;
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
