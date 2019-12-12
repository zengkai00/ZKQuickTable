//
//  ZKQuickTableBaseCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCell.h"
#import "ZKQuickTableBaseCellModel.h"
@interface ZKQuickTableBaseCell()
@property (nonatomic, strong)CALayer *bottomLine;//底部横线

@end

@implementation ZKQuickTableBaseCell

//cell初始化方法
+ (ZKQuickTableBaseCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView
{
    ZKQuickTableBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[ZKQuickTableBaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
}
- (void)setupUI
{
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    //是否需要显示底部横线
    if (model.isNeedShowLine == YES) {
        self.bottomLine.backgroundColor = model.lineColor.CGColor;
        self.bottomLine.frame = CGRectMake(model.lineLeftAndRight, model.cellHeight-0.5, KSys_Screen_Width - 2*model.lineLeftAndRight, 0.5);
    }
    //当cellClassString没有进行赋值
    if ([model.cellClassString isEqualToString:@"ZKQuickTableBaseCell"]) {
        self.textLabel.text = @"加载失败";
    }
}

//添加底部分割线
- (CALayer *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [CALayer layer];
        [self.contentView.layer addSublayer:_bottomLine];
    }
    return _bottomLine;
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
