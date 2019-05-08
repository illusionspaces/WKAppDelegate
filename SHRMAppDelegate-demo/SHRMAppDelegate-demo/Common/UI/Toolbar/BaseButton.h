//
//  BaseButton.h
//  APPEventModule
//
//  Created by 王凯 on 2019/2/13.
//  Copyright © 2019 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 功能:可以便捷的设置按钮的可视区域
 使用场景:按钮的可视区域小于触控区域
 用法:触控区由setFrame:设定,可视区域通过接口setContentArea:设置.
 */
@interface BaseButton : UIButton
/**
 *  相对于button的bounds,设置可视区域
 *
 *  @param areaRect 相对于bounds的可视区域
 */
- (void)setContentArea:(CGRect)areaRect;
@end

NS_ASSUME_NONNULL_END
