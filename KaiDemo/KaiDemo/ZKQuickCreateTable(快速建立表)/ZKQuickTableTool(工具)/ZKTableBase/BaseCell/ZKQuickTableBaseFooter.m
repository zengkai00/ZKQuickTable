//
//  ZKQuickTableBaseFooter.m
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseFooter.h"
#import "ZKQuickTableBaseFooterModel.h"
@interface ZKQuickTableBaseFooter()
@property (nonatomic, strong)CALayer *bottomLine;//底部横线
@end
@implementation ZKQuickTableBaseFooter

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    KSLog(@"父类的footer创建");
}
- (void)setFooterDataModel:(ZKQuickTableBaseFooterModel *)footerModel
{
    //KSLog(@"父类的model传入");
    if (footerModel.footerHeight <= 0) {
        self.hidden = YES;
    }else
    {
        self.hidden = NO;
    }
    //是否需要显示底部横线
    if (footerModel.isNeedShowLine == YES) {
        self.bottomLine.hidden = NO;
        self.bottomLine.backgroundColor = footerModel.lineColor.CGColor;
        self.bottomLine.frame = CGRectMake(footerModel.lineLeftAndRight, self.frame.size.height-0.5, [UIScreen mainScreen].bounds.size.width - 2*footerModel.lineLeftAndRight, 0.5);
    }else
    {
        self.bottomLine.hidden = YES;
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
