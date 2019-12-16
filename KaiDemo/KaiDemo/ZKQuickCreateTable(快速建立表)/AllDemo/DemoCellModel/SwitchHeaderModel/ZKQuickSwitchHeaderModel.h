//
//  ZKQuickSwitchHeaderModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/10.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickSwitchHeaderModel : ZKQuickTableBaseHeaderModel

@property (nonatomic,copy)NSString *titleString;//标题
@property (nonatomic,assign)BOOL isOnSwitch;//是否开关

@end

NS_ASSUME_NONNULL_END
