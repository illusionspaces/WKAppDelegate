//
//  UIConfigDefine.h
//  APPEventModule
//
//  Created by 王凯 on 2019/2/13.
//  Copyright © 2019 王凯. All rights reserved.
//

#ifndef UIConfigDefine_h
#define UIConfigDefine_h

#define UIColorFromRGBAValue(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define VIEWCONTROLLERBACKGROUNDCOLOR UIColorFromHexValue(0xf5f7fb)

typedef NS_ENUM(NSInteger, TestToolbarTag)
{
    TOOLBAR_TAG_FIRST = 0x0001000,
    TOOLBAR_TAG_SECOND,
    TOOLBAR_TAG_THIRD,
    TOOLBAR_TAG_FOURTH,
};

// 判断设备是否为Plus系列分辨率
#define IS_SCREEN_55_INCH    ([UIScreen mainScreen].bounds.size.width == 414 && [UIScreen mainScreen].bounds.size.height == 736)
// 判断设备是否为iPhone6系列分辨率
#define IS_SCREEN_47_INCH    ([UIScreen mainScreen].bounds.size.width == 375 && [UIScreen mainScreen].bounds.size.height == 667)
// 判断设备是否为iPhone5系列分辨率
#define IS_SCREEN_4_INCH    ([UIScreen mainScreen].bounds.size.width == 320 && [UIScreen mainScreen].bounds.size.height == 568)
// 判断设备是否为iPhone4系列分辨率
#define IS_SCREEN_35_INCH    ([UIScreen mainScreen].bounds.size.width == 320 && [UIScreen mainScreen].bounds.size.height == 480)
// 判断设备是否为X或XS分辨率
#define IS_iPhoneX ([UIScreen mainScreen].bounds.size.width == 375 && [UIScreen mainScreen].bounds.size.height == 812)
// 判断设备是否为MAX或XR分辨率
#define IS_iPhoneMAX_OR_XR ([UIScreen mainScreen].bounds.size.width == 414 && [UIScreen mainScreen].bounds.size.height == 896)
// 判断设备是否有刘海
#define IS_FringeScreen ((IS_iPhoneX) || (IS_iPhoneMAX_OR_XR))

#define STATUS_GAP (IS_FringeScreen? 44 : 20)

#define iPhoneXSafeBottomMargin (IS_FringeScreen ? 34.f : 0.f)

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  (IOS7_OR_LATER? [UIScreen mainScreen].bounds.size.height:([UIScreen mainScreen].bounds.size.height - STATUS_GAP))


#define NAV_BAR_HEIGHT 44
#define NAV_BAR_FRAME (IOS7_OR_LATER? CGRectMake(0, 0, ScreenWidth, NAV_BAR_HEIGHT + STATUS_GAP):CGRectMake(0, 0, ScreenWidth, NAV_BAR_HEIGHT))

#define TOOLBAR_BASICHEIGHT 48
#define TOOLBAR_HEIGHT (TOOLBAR_BASICHEIGHT + iPhoneXSafeBottomMargin)
#define SCROLLVIEW_GAP 20

#define IOS12_OR_LATER      ( [[[UIDevice currentDevice] systemVersion] compare:@"12.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS11_OR_LATER      ( [[[UIDevice currentDevice] systemVersion] compare:@"11.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS10_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS9_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS8_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS7_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS6_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS5_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"5.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS4_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"4.0" options:NSNumericSearch] != NSOrderedAscending )
#define IOS3_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"3.0" options:NSNumericSearch] != NSOrderedAscending )


#endif /* UIConfigDefine_h */
