//
//  SHRMBaseAppEventModule.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "SHRMBaseAppEventModule.h"
#import "SHRMAppEventModuleManager.h"

#define MODULE_LEVEL_DEFAULT 100

@implementation SHRMBaseAppEventModule

- (NSInteger)moduleLevel {
    return MODULE_LEVEL_DEFAULT;
}

- (void)destroyModule {
    [[SHRMAppEventModuleManager sharedInstance] removeModule:[self moduleID]];
    NSLog(@"%@ destroy",NSStringFromClass([self class]));
}

- (NSString *)moduleID {
    return NSStringFromClass([self class]);
}

@end
