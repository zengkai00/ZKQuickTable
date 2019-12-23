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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
}
//加载xib的方法
+ (ZKQuickTableBaseCell *)loadXibCellName:(NSString *)cellName
{
    ZKQuickTableBaseCell *baseCell = nil;
    NSArray *tempArray = [[NSBundle mainBundle]loadNibNamed:cellName owner:self options:nil];
    if (tempArray.count > 0) {
        baseCell = tempArray.firstObject;
        [baseCell setupUI];
    }else
    {
        baseCell = [[ZKQuickTableBaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    return baseCell;
}
- (void)setupUI
{
    //KSLog(@"创建父类UI");
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    if (model.cellHeight <= 0) {
        self.hidden = YES;
    }else
    {
        self.hidden = NO;
    }
    //是否需要显示底部横线
    if (model.isNeedShowLine == YES) {
        self.bottomLine.hidden = NO;
        self.bottomLine.backgroundColor = model.lineColor.CGColor;
        self.bottomLine.frame = CGRectMake(model.lineLeftAndRight, model.finalTableCellHeight-1, [UIScreen mainScreen].bounds.size.width - 2*model.lineLeftAndRight, 1);
    }else
    {
        self.bottomLine.hidden = YES;
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
