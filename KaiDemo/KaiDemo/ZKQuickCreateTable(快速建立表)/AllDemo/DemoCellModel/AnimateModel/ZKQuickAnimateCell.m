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
//@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIView      *lineView;
//@property (nonatomic, strong) UIView      *rectView;

@end

@implementation ZKQuickAnimateCell

- (void)setupUI
{
    [super setupUI];
//    _rectView  = [[UIView alloc] initWithFrame:CGRectMake(262, 23, 35, 35)];
//    _rectView.layer.borderWidth = 1.f;
//    _rectView.layer.borderColor = [UIColor grayColor].CGColor;
//    [self.contentView addSubview:_rectView];
//
//    // 图标
//    _iconView       = [[UIImageView alloc] initWithFrame:CGRectMake(260, 20, 40, 40)];
//    _iconView.image = [UIImage imageNamed:@"icon"];
//    _iconView.alpha = 0.f;
//    [self.contentView addSubview:_iconView];
    
    // 文字
    _name = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 300, 60)];
    _name.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:15];
    _name.textColor = [UIColor grayColor];
    [self.contentView addSubview:_name];
    
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(30, 70, 0, 2)];
    _lineView.alpha = 0.f;
    _lineView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_lineView];
}
- (void)setDataModel:(ZKQuickTableBaseCellModel *)model
{
    [super setDataModel:model];
    self.currentModel = (ZKQuickAnimateCellModel *)model;
    self.lineView.width_k = self.currentModel.lineWidth;
    self.name.x_k = self.currentModel.nameX;
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

- (void)showIconAnimated:(BOOL)animated {
    KSLog(@"%@,%@",NSStringFromCGRect(self.lineView.frame),NSStringFromCGRect(self.name.frame));
    if (animated) {
        //_iconView.transform = CGAffineTransformMake(2, 0, 0, 2, 0, 0);
        [UIView animateWithDuration:0.5 animations:^{
            self.lineView.alpha = 1.f;
            self.lineView.width_k = 200;
            self.name.x_k = 80;
            
            self.currentModel.lineWidth = 200;
            self.currentModel.nameX = 80;
        } completion:^(BOOL finished) {
        }];
//        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            //            self->_iconView.alpha     = 1.f;
//            //            self->_iconView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
//                        self.lineView.alpha = 1.f;
//                        self.lineView.width_k = 200;
//                        self.name.x_k = 80;
//            //            self->_rectView.layer.borderColor  = [UIColor redColor].CGColor;
//            //            self->_rectView.transform          = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0);
//            //            self->_rectView.layer.cornerRadius = 4.f;
//        } completion:^(BOOL finished) {
//
//        }];
    } else {
//        _iconView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
//        _iconView.alpha     = 1.f;
        self.lineView.alpha = 1.f;
        self.lineView.width_k = 200;
        self.name.x_k = 80;
        
        self.currentModel.lineWidth = 200;
        self.currentModel.nameX = 80;
//        _rectView.layer.borderColor  = [UIColor redColor].CGColor;
//        _rectView.transform          = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0);
//        _rectView.layer.cornerRadius = 4.f;
    }
}

- (void)hideIconAnimated:(BOOL)animated {
    if (animated) {
        KSLog(@"%@,%@",NSStringFromCGRect(self.lineView.frame),NSStringFromCGRect(self.name.frame));
        
        [UIView animateWithDuration:0.5 animations:^{
            self.lineView.alpha = 0.f;
            self.lineView.width_k = 0;
            self.name.x_k = 30;
            
            self.currentModel.lineWidth = 0;
            self.currentModel.nameX = 30;
        } completion:^(BOOL finished) {
            
        }];
//        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            //            self->_iconView.alpha     = 0.f;
//            //            self->_iconView.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
//                        self.lineView.alpha = 0.f;
//                        self.lineView.width_k = 0;
//                        self.name.x_k = 30;
//            //            self->_rectView.layer.borderColor  = [UIColor grayColor].CGColor;
//            //            self->_rectView.transform          = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
//            //            self->_rectView.layer.cornerRadius = 0;
//        } completion:^(BOOL finished) {
//
//        }];
    } else {
//        _iconView.alpha     = 0.f;
        self.lineView.alpha = 0.f;
        self.lineView.width_k = 0;
        self.name.x_k = 30;
        
        self.currentModel.lineWidth = 0;
        self.currentModel.nameX = 30;
//        _rectView.layer.borderColor  = [UIColor grayColor].CGColor;
//        _rectView.transform          = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
//        _rectView.layer.cornerRadius = 0;
    }
}

- (void)showSelectedAnimation {
    UIView *tmpView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    tmpView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.30];
    tmpView.alpha           = 0.f;
    
    [self addSubview:tmpView];
    
    
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
