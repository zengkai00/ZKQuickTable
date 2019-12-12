//
//  UIImageView+ZKQuick.m
//  KaiDemo
//
//  Created by Kai on 2019/12/1.
//  Copyright © 2019 Kai. All rights reserved.
//

#import "UIImageView+ZKQuick.h"

@implementation UIImageView (ZKQuick)

//
+ (UIImageView *)createZKImageViewWithFatherView:(UIView *)fatherView ImageName:(NSString *)imageName
{
    UIImageView *imageV = [[UIImageView alloc] init];
    if (imageName.length > 0) {
        imageV.image = KSys_GetImage(imageName);
    }
    [fatherView addSubview:imageV];
    return imageV;
}


@end
