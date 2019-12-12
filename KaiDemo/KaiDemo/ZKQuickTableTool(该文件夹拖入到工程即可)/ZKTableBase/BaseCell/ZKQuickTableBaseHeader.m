//
//  ZKQuickTableBaseHeader.m
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseHeader.h"

@interface ZKQuickTableBaseHeader()

@end

@implementation ZKQuickTableBaseHeader

//header初始化方法
+ (ZKQuickTableBaseHeader *)headerWithIdentifier:(NSString *)headerIdentifier tableView:(UITableView *)tableView
{
    ZKQuickTableBaseHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    if (!header) {
        header = [[ZKQuickTableBaseHeader alloc] initWithReuseIdentifier:headerIdentifier];
    }
    return header;
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
    KSLog(@"父类的header创建");
}
- (void)setHeaderDataModel:(ZKQuickTableBaseHeaderModel *)headerModel
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
