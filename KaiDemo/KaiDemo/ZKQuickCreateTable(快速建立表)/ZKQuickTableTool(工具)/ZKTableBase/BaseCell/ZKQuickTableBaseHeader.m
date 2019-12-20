//
//  ZKQuickTableBaseHeader.m
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseHeader.h"
#import "ZKQuickTableBaseHeaderModel.h"
@interface ZKQuickTableBaseHeader()
@property (nonatomic, strong)CALayer *bottomLine;//底部横线
@end

@implementation ZKQuickTableBaseHeader

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
    //KSLog(@"父类的header创建");
}
- (void)setHeaderDataModel:(ZKQuickTableBaseHeaderModel *)headerModel
{
    //KSLog(@"父类的model传入");
    if (headerModel.headerHeight <= 0) {
        self.hidden = YES;
    }else
    {
        self.hidden = NO;
    }
    //是否需要显示底部横线
    if (headerModel.isNeedShowLine == YES) {
        self.bottomLine.hidden = NO;
        self.bottomLine.backgroundColor = headerModel.lineColor.CGColor;
        self.bottomLine.frame = CGRectMake(headerModel.lineLeftAndRight, self.frame.size.height-0.5, [UIScreen mainScreen].bounds.size.width - 2*headerModel.lineLeftAndRight, 0.5);
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
