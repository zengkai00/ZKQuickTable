//
//  ZKQuickTextFieldCellModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/12.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickTextFieldCellModel : ZKQuickTableBaseCellModel

@property (nonatomic,copy)NSString *titleString;//标题
@property (nonatomic,copy)NSString *tfString;//输入框输入的文字

@end

NS_ASSUME_NONNULL_END
