//
//  ZKQuickTableBaseHeaderModel.h
//  KaiDemo
//
//  Created by Kai on 2019/12/5.
//  Copyright © 2019 Kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKQuickTableBaseHeaderModel : NSObject

//基础属性

//唯一标识符(更新会用到)
@property (nonatomic, copy)NSString *identifierHeader;

//该模型绑定的header类名 默认ZKQuickTableBaseHeader
@property (nonatomic, copy)NSString *headerClassString;

//header的高度 默认高度0.01
@property (nonatomic, assign)CGFloat headerHeight;


@end

