//
//  UILabel+ZKQuick.m
//  KaiDemo
//
//  Created by Kai on 2019/11/30.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "UILabel+ZKQuick.h"

@implementation UILabel (ZKQuick)

+ (UILabel *)createZKLabelWithFatherView:(UIView *)fatherView textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.font = font;
    [fatherView addSubview:label];
    return label;
}

@end
