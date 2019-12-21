//
//  ZKQuickAnimateCell.m
//  KaiDemo
//
//  Created by Kai on 2019/12/18.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickAnimateCell.h"
#import "ZKQuickAnimateCellModel.h"
@interface ZKQuickAnimateCell()
@property (nonatomic, strong)ZKQuickAnimateCellModel *currentModel;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIView      *lineView;
@property (nonatomic, strong) UIView      *rectView;

@end

@implementation ZKQuickAnimateCell

- (void)setupUI
{
    [super setupUI];
    
    self.rectView  = [[UIView alloc] initWithFrame:CGRectMake(KSys_Screen_Width - 45, 10+12, 36, 36)];
    self.rectView.layer.borderWidth = 1.f;
    self.rectView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.contentView addSubview:self.rectView];

    // 图标
    _iconView       = [[UIImageView alloc] initWithFrame:CGRectMake(KSys_Screen_Width - 45, 10+10, 40, 40)];
    _iconView.image = [UIImage imageNamed:@"zk_dagou@2x"];
    _iconView.alpha = 0.f;
    [self.contentView addSubview:_iconView];
    
    // 文字
    _name = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 300, 60)];
    _name.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:15];
    _name.textColor = [UIColor grayColor];
    [self.contentView addSubview:_name];
    
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(30, 70, 0, 2)];
    _lineView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_lineView];
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    self.currentModel = (ZKQuickAnimateCellModel *)model;
    [self animateWithAllView];
    
    //点击了选择
    if (self.currentModel.isSelect) {
        self.name.text = @"选择咯~~~";
        [self showIconAnimated:self.currentModel.isAnimate];
    }else
    {
        self.name.text = self.currentModel.name;
        [self hideIconAnimated:self.currentModel.isAnimate];
    }
    if (self.currentModel.isAnimate == YES) {
        self.currentModel.isAnimate = NO;
    }
}

//所有view的动画
- (void)animateWithAllView
{
    self.lineView.width_k = self.currentModel.lineWidth;
    self.lineView.alpha = self.currentModel.curLineAlpha;
    self.name.x_k = self.currentModel.nameX;
    self.rectView.layer.borderColor = self.currentModel.curRectColor.CGColor;
    self.rectView.transform = self.currentModel.curRectTransform;
    self.rectView.layer.cornerRadius = self.currentModel.curRectCornerRadius;
    self.iconView.transform = self.currentModel.curIconTransform;
    self.iconView.alpha = self.currentModel.curIconAlpha;
}

- (void)showIconAnimated:(BOOL)animated {
    self.currentModel.lineWidth = 200;
    self.currentModel.nameX = 80;
    self.currentModel.curRectColor = [UIColor redColor];
    self.currentModel.curRectTransform = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0);
    self.currentModel.curRectCornerRadius = 4;
    self.currentModel.curLineAlpha = 1;
    self.currentModel.curIconTransform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
    self.currentModel.curIconAlpha = 1;
    if (animated) {
        [self showSelectedAnimation];
        [UIView animateWithDuration:0.5 animations:^{
            [self animateWithAllView];
        } completion:^(BOOL finished) {
            
        }];
    } else {
        [self animateWithAllView];
    }
}

- (void)hideIconAnimated:(BOOL)animated {
    self.currentModel.lineWidth = 0;
    self.currentModel.nameX = 30;
    self.currentModel.curRectColor = [UIColor grayColor];
    self.currentModel.curRectTransform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
    self.currentModel.curRectCornerRadius = 0;
    self.currentModel.curLineAlpha = 0;
    self.currentModel.curIconTransform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
    self.currentModel.curIconAlpha = 0;
    if (animated) {
        [self showSelectedAnimation];
        [UIView animateWithDuration:0.5 animations:^{
            [self animateWithAllView];
        } completion:^(BOOL finished) {
            
        }];
    } else {
        [self animateWithAllView];
    }
}

- (void)showSelectedAnimation {
    UIView *tmpView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSys_Screen_Width, 80)];
    tmpView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.30];
    tmpView.alpha           = 0.f;
    [self.contentView addSubview:tmpView];
    [UIView animateWithDuration:0.20 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        tmpView.alpha = 0.8f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.20 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            tmpView.alpha = 0.f;
        } completion:^(BOOL finished) {
            [tmpView removeFromSuperview];
        }];
    }];
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
