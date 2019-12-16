//
//  ZKQuickTableSwitchModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableSwitchModel.h"

@implementation ZKQuickTableSwitchModel

//创建model
- (id)initWithIconImageName:(NSString *)iconImageName title:(NSString *)title detailString:(NSString *)detailString clickBlock:(ZKClickCellBlock)clickBlock
{
    self = [super init];
    if (self) {
        self.zkCellBlock = clickBlock;
        self.isNeedShowLine = YES;
        self.cellClassString = @"ZKQuickTableSwitchCell";
        self.arrowImageName = @"zk_arrow";
        self.iconImageName = iconImageName;
        self.titleString = title;
        self.detailString = detailString;
    }
    return self;
}

@end
