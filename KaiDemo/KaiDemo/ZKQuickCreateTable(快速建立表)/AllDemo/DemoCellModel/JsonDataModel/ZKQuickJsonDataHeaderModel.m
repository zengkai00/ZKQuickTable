//
//  ZKQuickJsonDataHeaderModel.m
//  KaiDemo
//
//  Created by Kai on 2019/12/14.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickJsonDataHeaderModel.h"

@implementation ZKQuickJsonDataHeaderModel

//必需实现的一些属性
- (id)init
{
    self = [super init];
    if (self) {
        self.headerClassString = @"ZKQuickJsonDataHeader";
        self.headerHeight = 80;
        self.isNeedShowLine = YES;
        self.lineColor = KColor_Cyan;
    }
    return self;
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"cellList":@"ZKQuickJsonDataCellModel"};
}
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
  // value使用[ZKQuickJsonDataCellModel class]或ZKQuickJsonDataCellModel.class或@"YYEatModel"没有区别
  return @{@"cellList" : @"ZKQuickJsonDataCellModel"};
}

@end
