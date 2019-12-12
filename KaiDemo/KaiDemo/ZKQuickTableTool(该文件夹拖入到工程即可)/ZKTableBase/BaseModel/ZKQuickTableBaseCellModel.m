//
//  ZKQuickTableBaseCellModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCellModel.h"

@implementation ZKQuickTableBaseCellModel

- (id)init
{
    self = [super init];
    if (self) {
        //获取当前时间
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        //获取当前线程id
        NSString *threadNumber = [[[NSString stringWithFormat:@"%@",[NSThread currentThread]] componentsSeparatedByString:@"number = "].lastObject componentsSeparatedByString:@","].firstObject;
        self.identifier = [NSString stringWithFormat:@"%lf%@",now,threadNumber];
        self.cellHeight = 44;//每个cell默认高度 44
        self.cellClassString = @"ZKQuickTableBaseCell";//默认baseCell
        self.isNeedShowLine = NO;
        self.lineColor = [UIColor lightGrayColor];
        self.lineLeftAndRight = 0;
        /*UITableViewCellSelectionStyleNone
        UITableViewCellSelectionStyleDefault*/
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end
