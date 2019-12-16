//
//  ZKQuickButtonTypeOneModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/13.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickButtonTypeOneModel.h"

@implementation ZKQuickButtonTypeOneModel

- (id)init
{
    self = [super init];
    if (self) {
        self.isXibCell = YES;
        self.cellClassString = @"ZKQuickButtonTypeOneCell";
        self.isNeedShowLine = YES;
        self.changeNumberValue = 0;
    }
    return self;
}

@end
