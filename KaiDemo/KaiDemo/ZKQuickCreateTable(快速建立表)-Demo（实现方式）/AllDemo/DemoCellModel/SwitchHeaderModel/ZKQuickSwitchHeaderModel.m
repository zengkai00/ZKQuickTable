//
//  ZKQuickSwitchHeaderModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/10.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickSwitchHeaderModel.h"

@implementation ZKQuickSwitchHeaderModel

//必需实现的一些属性
- (id)init
{
    self = [super init];
    if (self) {
        self.headerClassString = @"ZKQuickSwitchHeader";
    }
    return self;
}

@end
