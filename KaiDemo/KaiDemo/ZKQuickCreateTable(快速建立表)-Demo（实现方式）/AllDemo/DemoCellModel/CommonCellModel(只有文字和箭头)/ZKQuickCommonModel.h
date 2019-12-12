//
//  ZKQuickCommonModel.h
//  KaiDemo
//
//  Created by Kai on 2019/11/28.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickCommonModel : ZKQuickTableBaseCellModel

@property (nonatomic,copy)NSString *titleString;//标题
@property (nonatomic,copy)NSString *arrowImageName;//箭头图片
@property (nonatomic,copy)NSString *pushControllerStr;//跳转的controller

@end

NS_ASSUME_NONNULL_END
