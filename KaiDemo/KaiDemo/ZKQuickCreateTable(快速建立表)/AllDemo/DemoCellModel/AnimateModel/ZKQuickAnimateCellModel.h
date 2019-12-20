//
//  ZKQuickAnimateCellModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/18.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "ZKQuickTableBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZKQuickAnimateCellModel : ZKQuickTableBaseCellModel

@property (nonatomic,copy)NSString *name;//
@property (nonatomic,assign)BOOL isSelect;//
@property (nonatomic,assign)BOOL isAnimate;//

@property (nonatomic,assign)CGFloat lineWidth;//
@property (nonatomic,assign)CGFloat nameX;//

@end

NS_ASSUME_NONNULL_END
