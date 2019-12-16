//
//  ZKQuickButtonTypeOneCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/13.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickButtonTypeOneCell.h"
#import "ZKQuickButtonTypeOneModel.h"
@interface ZKQuickButtonTypeOneCell()
{
    int changeBtType;//1:减少 2:增加
}
@property (nonatomic, strong) NSTimer *timer;//定时器
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *numberLb;//费率
@property (weak, nonatomic) IBOutlet UIButton *reduceBt;//减号
@property (weak, nonatomic) IBOutlet UIButton *addBt;//加号

@property (nonatomic,strong)ZKQuickButtonTypeOneModel *currentModel;

@end

@implementation ZKQuickButtonTypeOneCell
- (void)setupUI
{
    [super setupUI];
    self.numberLb.layer.cornerRadius = 11;
    self.numberLb.layer.borderColor = KColor_Blue.CGColor;
    self.numberLb.layer.borderWidth = 1;
    self.numberLb.layer.masksToBounds = YES;
    //添加费率按钮事件
    [self.reduceBt addTarget:self action:@selector(zktouchDown:) forControlEvents:UIControlEventTouchDown];
    [self.reduceBt addTarget:self action:@selector(zktouchUp:) forControlEvents:UIControlEventTouchUpOutside|UIControlEventTouchUpInside|UIControlEventTouchCancel];
    [self.addBt addTarget:self action:@selector(zktouchDown:) forControlEvents:UIControlEventTouchDown];
    [self.addBt addTarget:self action:@selector(zktouchUp:) forControlEvents:UIControlEventTouchUpOutside|UIControlEventTouchUpInside|UIControlEventTouchCancel];
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    self.currentModel = (ZKQuickButtonTypeOneModel *)model;
    self.titleLb.text = self.currentModel.titleString;
    self.numberLb.text = [NSString stringWithFormat:@"%d",self.currentModel.changeNumberValue];
}

//-----按钮定时器
//点击: 单击逐次加减,长按连续快速加减
- (void)zktouchDown:(UIButton *)sender
{
    if (sender == self.addBt) {
        changeBtType = 2;
    } else {
        changeBtType = 1;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeRateData) userInfo:nil repeats:YES];
    [_timer fire];
}

/// 手指松开
- (void)zktouchUp:(UIButton *)sender {
    [self cleanTimer];
}
// 清除定时器
- (void)cleanTimer
{
    if (_timer.isValid) {
        [_timer invalidate];
        _timer = nil;
    }
}
//changeRateType 1:减少 2:增加
- (void)changeRateData
{
    int currentRate = self.currentModel.changeNumberValue;
    if (changeBtType == 1) {
        //减少
        int minRateF = 0;
        if (currentRate > minRateF) {
            currentRate = currentRate - 1;
        }else {
            currentRate = minRateF;
        }
    }else if(changeBtType == 2)
    {
        //增加
        int maxRateF = 100;
        if (currentRate < maxRateF) {
            currentRate = currentRate + 1;
        }else {
            currentRate = maxRateF;
        }
    }
    self.currentModel.changeNumberValue = currentRate;
    self.numberLb.text = [NSString stringWithFormat:@"%d",self.currentModel.changeNumberValue];
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
