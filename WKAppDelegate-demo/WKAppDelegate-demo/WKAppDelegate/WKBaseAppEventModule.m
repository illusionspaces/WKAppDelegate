//
//  WKBaseAppEventModule.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "WKBaseAppEventModule.h"
#import "WKAppEventModuleManager.h"

#define MODULE_LEVEL_DEFAULT 100

@implementation WKBaseAppEventModule

- (NSInteger)moduleLevel {
    return MODULE_LEVEL_DEFAULT;
}

- (void)destroyModule {
    [[WKAppEventModuleManager sharedInstance] removeModule:[self moduleID]];
    NSLog(@"%@ destroy",NSStringFromClass([self class]));
}

- (NSString *)moduleID {
    return NSStringFromClass([self class]);
}

@end
