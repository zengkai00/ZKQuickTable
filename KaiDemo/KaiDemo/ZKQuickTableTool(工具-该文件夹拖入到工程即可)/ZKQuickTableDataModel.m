//
//  ZKQuickTableDataModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableDataModel.h"

@implementation ZKQuickTableDataModel

- (id)init
{
    self = [super init];
    if (self) {
        self.isOpenCellModelHeight = NO;
        self.isOpenHeaderModelHeight = NO;
        self.cellHeight = 44;
        self.headerHeight = 0.01;
        self.footerHeight = 0.01;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.isOpenModelSelectionStyle = NO;
    }
    return self;
}

@end
