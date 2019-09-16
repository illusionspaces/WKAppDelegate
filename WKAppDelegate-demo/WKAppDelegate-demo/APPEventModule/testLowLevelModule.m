//
//  testLowLevelModule.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "testLowLevelModule.h"

SHRMAppEventMod(testLowLevelModule)

@implementation testLowLevelModule

- (NSInteger)moduleLevel {
    return 2;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initMudule];
    [self destroyModule];
    return YES;
}

- (void)initMudule {
    NSLog(@"%@ init", NSStringFromClass([self class]));
}


@end
