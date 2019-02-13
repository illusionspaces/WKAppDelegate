//
//  SHRMAppEventModuleManager.h
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHRMAppEventModuleManager : NSObject
/**
 当前需要执行的AppEventModule容器
 */
@property (nonatomic, strong) NSMutableArray *appEventModules;

+ (instancetype)sharedInstance;

/**
 初始化所有的AppDelegate相关的Event Modules
 */
- (void)registedAllModules;

/**
 触发evetn module处理AppDelegate回调事件
 
 @param eventSel AppDelegate 回调事件消息
 @param complete module处理handle
 */
- (void)handleApplicationEvent:(SEL)eventSel
                      Complete:(void(^)(id module,SEL sel))complete;

/**
 移除module对象
 
 @param moduleID module ID
 */
- (void)removeModule:(NSString *)moduleID;
@end

NS_ASSUME_NONNULL_END
