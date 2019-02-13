//
//  SHRMAppEventModuleProtocol.h
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SHRMAppEventModuleProtocol <UIApplicationDelegate>

/**
 mudule执行优先级

 @return return value description
 */
- (NSInteger)moduleLevel;


/**
 执行完成释放module
 */
- (void)destroyModule;


/**
 获取module id

 @return id
 */
- (NSString *)moduleID;

@end

NS_ASSUME_NONNULL_END
