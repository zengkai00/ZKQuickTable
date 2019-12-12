//
//  UIView+ZKQuick.m
//  KaiDemo
//
//  Created by Kai on 2019/12/6.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "UIView+ZKQuick.h"

@implementation UIView (ZKQuick)

+ (UIView *)createZKViewWithFatherView:(UIView *)fatherView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = KColor_White;
    [fatherView addSubview:view];
    return view;
}

@end
