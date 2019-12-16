//
//  ZKQuickJsonDataCellModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/14.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickJsonDataCellModel.h"

@implementation ZKQuickJsonDataCellModel

- (id)init
{
    self = [super init];
    if (self) {
        self.isNeedShowLine = YES;
        self.cellClassString = @"ZKQuickJsonDataCell";
        self.saveCellHeight = 44;
    }
    return self;
}

@end
