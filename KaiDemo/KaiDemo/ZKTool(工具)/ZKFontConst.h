//
//  ZKFontConst.h
//  KaiDemo
//
//  Created by Kai on 2019/11/4.
//  Copyright © 2019 Kai. All rights reserved.
//

#ifndef ZKFontConst_h
#define ZKFontConst_h

#define KFont_System(s) [UIFont systemFontOfSize:s]
#define KFont_System_Medium(s) [UIFont fontWithName:@"PingFang-SC-Medium" size:s]
#define KFont_SystemBold(s) [UIFont boldSystemFontOfSize:s]
#define KFont_AvenirMedium(s) [UIFont fontWithName:@"Avenir-Medium" size:s]
#define KFont_AvenirBlack(s) [UIFont fontWithName:@"Avenir-Black" size:s]
#define KFont_MarkerFeltThin(s) [UIFont fontWithName:@"MarkerFelt-Thin" size:s]
#define KFont_ArialRoundedMTBold(s) [UIFont fontWithName:@"ArialRoundedMTBold" size:s]
#define KFont_AmericanTypewriterBold(s) [UIFont fontWithName:@"AmericanTypewriter-Bold" size:s]
#define KFont_HelveticaNeueBold(s) [UIFont fontWithName:@"HelveticaNeue-Bold" size:s]

#define KFont_MainFont(s) KFont_System_Medium(s) //我的界面中 主要font


#endif /* ZKFontConst_h */
