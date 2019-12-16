//
//  ZKQuickTableSwitchModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/7.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCellModel.h"

@interface ZKQuickTableSwitchModel : ZKQuickTableBaseCellModel

@property (nonatomic,copy)NSString *iconImageName;//图标图片
@property (nonatomic,copy)NSString *titleString;//标题
@property (nonatomic,copy)NSString *detailString;//详情
@property (nonatomic,copy)NSString *arrowImageName;//箭头图片
@property (nonatomic,assign)BOOL isOnSwitch;//是否开关
//创建model
- (id)initWithIconImageName:(NSString *)iconImageName title:(NSString *)title detailString:(NSString *)detailString clickBlock:(ZKClickCellBlock)clickBlock;

@end
