//
//  ZKColorConst.h
//  KaiDemo
//
//  Created by Kai on 2019/11/4.
//  Copyright © 2019 Kai. All rights reserved.
//

#ifndef ZKColorConst_h
#define ZKColorConst_h

//rgb
#define KColor_RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//app主要颜色
#define KColor_Main [UIColor colorWithRed:35/255.0 green:130/255.0 blue:255/255.0 alpha:1.0]
//随机颜色rgb
#define KColor_Random [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0]
//十六进制颜色
#define KColor_16RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]// rgb颜色转换（16进制->10进制）

//app所有controller的背景颜色（浅灰色）//背景颜色
#define KColor_GreyMainBgColor KColor_16RGB(0xEFEFF5)

//label的颜色 由深到浅
#define KColor_333333 KColor_16RGB(0x333333)
#define KColor_666666 KColor_16RGB(0x666666)
#define KColor_999999 KColor_16RGB(0x999999)

//系统颜色
#define KColor_White [UIColor whiteColor]
#define KColor_Black [UIColor blackColor]
#define KColor_DarkGray [UIColor darkGrayColor]
#define KColor_LightGray [UIColor lightGrayColor]
#define KColor_Gray [UIColor grayColor]
#define KColor_Red [UIColor redColor]
#define KColor_Green [UIColor greenColor]
#define KColor_Blue [UIColor blueColor]
#define KColor_Cyan [UIColor cyanColor]
#define KColor_Yellow [UIColor yellowColor]
#define KColor_Magenta [UIColor magentaColor]
#define KColor_Orange [UIColor orangeColor]
#define KColor_Purple [UIColor purpleColor]
#define KColor_Brown [UIColor brownColor]
#define KColor_Clear [UIColor clearColor]


#endif /* ZKColorConst_h */
