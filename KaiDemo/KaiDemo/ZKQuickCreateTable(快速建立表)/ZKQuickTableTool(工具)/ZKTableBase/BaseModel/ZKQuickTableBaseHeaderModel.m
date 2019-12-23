//
//  ZKQuickTableBaseHeaderModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseHeaderModel.h"

@implementation ZKQuickTableBaseHeaderModel

- (id)init
{
    self = [super init];
    if (self) {
        //获取当前时间
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        //获取当前线程id
        NSString *threadNumber = [[[NSString stringWithFormat:@"%@",[NSThread currentThread]] componentsSeparatedByString:@"number = "].lastObject componentsSeparatedByString:@","].firstObject;
        self.identifierHeader = [NSString stringWithFormat:@"header_%lf%@",now,threadNumber];
        self.headerHeight = 0.01;//header默认高度0.01
        self.headerClassString = @"ZKQuickTableBaseHeader";//默认header
        self.isNeedShowLine = NO;
        self.lineColor = [UIColor lightGrayColor];
        self.lineLeftAndRight = 0;
        self.finalTableHeaderHeight = 0.01;
    }
    return self;
}

@end
