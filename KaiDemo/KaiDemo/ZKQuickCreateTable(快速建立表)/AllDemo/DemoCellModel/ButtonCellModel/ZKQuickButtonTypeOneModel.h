//
//  ZKQuickButtonTypeOneModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/13.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickButtonTypeOneModel : ZKQuickTableBaseCellModel

@property (nonatomic,assign)int changeNumberValue;//改变的数值
@property (nonatomic,copy)NSString *titleString;

@end

NS_ASSUME_NONNULL_END
