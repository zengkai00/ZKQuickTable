//
//  ZKQuickJsonDataHeaderModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/14.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickJsonDataHeaderModel : ZKQuickTableBaseHeaderModel

@property (nonatomic,copy)NSString *sectionTitle;
@property (nonatomic,strong)NSMutableArray *cellList;
@property (nonatomic,copy)NSString *number;
@property (nonatomic,assign)BOOL sectionSwitchOn;

//点击了header switch后回调。
@property (nonatomic,copy)void (^switchHeaderBlock)(ZKQuickJsonDataHeaderModel *currentHeaderModel);

@end

NS_ASSUME_NONNULL_END
