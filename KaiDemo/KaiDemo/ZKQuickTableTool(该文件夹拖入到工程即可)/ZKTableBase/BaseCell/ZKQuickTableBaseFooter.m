//
//  ZKQuickTableBaseFooter.m
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseFooter.h"
@interface ZKQuickTableBaseFooter()

@end
@implementation ZKQuickTableBaseFooter

//footer初始化方法
+ (ZKQuickTableBaseFooter *)footerWithIdentifier:(NSString *)footerIdentifier tableView:(UITableView *)tableView
{
    ZKQuickTableBaseFooter *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerIdentifier];
    if (!footer) {
        footer = [[ZKQuickTableBaseFooter alloc] initWithReuseIdentifier:footerIdentifier];
    }
    return footer;
}

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
    KSLog(@"父类的model传入");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
