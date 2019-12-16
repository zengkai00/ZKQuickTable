//
//  ZKQuickTableBaseFooterModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseFooterModel.h"

@implementation ZKQuickTableBaseFooterModel

- (id)init
{
    self = [super init];
    if (self) {
        //获取当前时间
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        //获取当前线程id
        NSString *threadNumber = [[[NSString stringWithFormat:@"%@",[NSThread currentThread]] componentsSeparatedByString:@"number = "].lastObject componentsSeparatedByString:@","].firstObject;
        self.identifierFooter = [NSString stringWithFormat:@"footer_%lf%@",now,threadNumber];
        self.footerHeight = 0.01;//header默认高度0.01
        self.footerClassString = @"ZKQuickTableBaseFooter";//默认header
        self.isNeedShowLine = NO;
        self.lineColor = [UIColor lightGrayColor];
        self.lineLeftAndRight = 0;
    }
    return self;
}

@end
