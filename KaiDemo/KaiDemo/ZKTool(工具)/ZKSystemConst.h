//
//  ZKSystemConst.h
//  KaiDemo
//
//  Created by Kai on 2019/11/4.
//  Copyright © 2019 Kai. All rights reserved.
//

#ifndef ZKSystemConst_h
#define ZKSystemConst_h

//--------该类以 K开头 S:代表system

//----1.KSLog
#if DEBUG
#define KSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] \t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define KSLog(FORMAT, ...) nil
#endif

//----2.宽高
#define KSys_Screen_Width ([UIScreen mainScreen].bounds.size.width)
#define KSys_Screen_Height ([UIScreen mainScreen].bounds.size.height)

//----3.StatusBar高度（通常 状态栏+导航栏=20+44=64 ，iPhone X 状态栏+导航栏=44+44=88）
#define KSys_StatusBar_Height [UIApplication sharedApplication].statusBarFrame.size.height

//----4.navigationBar高度
#define KSys_Nav_Height self.navigationController.navigationBar.frame.size.height

//----4.1 nav+status 两者想加的高度
#define KSys_NavAndStatus_Height (KSys_StatusBar_Height+KSys_Nav_Height)

//----5.获取window
#define KSys_Window [UIApplication sharedApplication].delegate.window

//----6.获取当前系统版本 (小数和字符串)
#define KSys_iOS_Version_Float [[[UIDevice currentDevice] systemVersion] floatValue]
#define KSys_iOS_Version_NSString [[UIDevice currentDevice] systemVersion]

//----7.判断iOS或更高的系统版本
#define KSys_iOS_Version_6_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue]>=6.0)? (YES):(NO))
#define KSys_iOS_Version_7_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)? (YES):(NO))
#define KSys_iOS_Version_8_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)? (YES):(NO))
#define KSys_iOS_Version_9_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0)? (YES):(NO))
#define KSys_iOS_Version_10_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue]>=10.0)? (YES):(NO))
#define KSys_iOS_Version_11_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue]>=11.0)? (YES):(NO))
#define KSys_iOS_Version_12_Or_Later (([[[UIDevice currentDevice] systemVersion] floatValue]>=12.0)? (YES):(NO))

//----8.判断是否为iPhone
#define KSys_Is_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
 
//----9.判断是否为iPad
#define KSys_Is_iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//----10.userDefaults
#define KSys_UserDefaults_SetObjAndKey(OBJ,KEY) [[NSUserDefaults standardUserDefaults] setObject:OBJ forKey:KEY]
#define KSys_UserDefaults_ObjFor(KEY) [[NSUserDefaults standardUserDefaults] objectForKey:KEY]

//----11.weakself
#define KSys_WeakSelf __weak __typeof(self) weakSelf = self //weak

//----12.Image
#define KSys_GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//----13.string
#define KSys_NSString(object) [NSString stringWithFormat:@"%@",object]

//----14.防止多次调用（防止按钮重复点击）
#define KSys_PreventRepeatClickTime(_seconds_) \
static BOOL shouldPrevent; \
if (shouldPrevent) return; \
shouldPrevent = YES; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((_seconds_) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
shouldPrevent = NO; \
}); \

//----15.

#endif /* ZKSystemConst_h */
