//
//  ZKQuickJsonDataCellModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/14.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCellModel.h"

#define ZKQuickJsonData_ClickCellHeight 100;
@class ZKQuickJsonDataCell;
NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickJsonDataCellModel : ZKQuickTableBaseCellModel
//type one 和 two
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,assign)int type;//1:带有switch的  2:简单的标题和内容
@property (nonatomic,assign)CGFloat saveCellHeight;//临时存储cell高度 用于点击打开了header的switch后，cell的当前高度恢复到原来的高度

//type one
@property (nonatomic,assign)BOOL switchOn;
@property (nonatomic,assign)BOOL isAnimate;
//点击了header switch后回调。
@property (nonatomic,copy)void (^switchCellBlock)(ZKQuickJsonDataCellModel *currentModel);

@end

NS_ASSUME_NONNULL_END
