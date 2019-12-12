//
//  ZKQuickCommonModel.m
//  KaiDemo
//
//  Created by Kai on 2019/11/28.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickCommonModel.h"

@implementation ZKQuickCommonModel

- (id)init
{
    self = [super init];
    if (self) {
        self.isNeedShowLine = YES;
        self.arrowImageName = @"zk_arrow";
        self.cellClassString = @"ZKQuickCommonCell";
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    return self;
}

@end
