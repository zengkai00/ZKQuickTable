//
//  ZKQuickTextFieldCellModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/12.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTextFieldCellModel.h"

@implementation ZKQuickTextFieldCellModel

- (id)init
{
    self = [super init];
    if (self) {
        self.cellClassString = @"ZKQuickTextFieldCell";
        self.isXibCell = YES;
        self.isNeedShowLine = YES;
    }
    return self;
}

@end
