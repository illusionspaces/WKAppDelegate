//
//  testMudule.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "testMudule.h"
#import "SHRMAppEventAnnotation.h"

SHRMAppEventMod(testMudule)

@implementation testMudule

- (NSInteger)moduleLevel {
    return 1;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initMudule];
    [self destroyModule];
    return YES;
}

- (void)initMudule {
    NSLog(@"testMudule init");
}

@end
