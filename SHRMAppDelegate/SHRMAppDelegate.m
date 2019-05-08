//
//  SHRMAppDelegate.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "SHRMAppDelegate.h"
#import "SHRMAppEventModuleManager.h"

@implementation SHRMAppDelegate

+ (void)load {
    [[SHRMAppEventModuleManager sharedInstance] registedAllModules];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[SHRMAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(application:didFinishLaunchingWithOptions:)
                                                              Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [module performSelector:sel
                     withObject:application
                     withObject:launchOptions];
#pragma clang diagnostic pop
    }];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [[SHRMAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(applicationDidEnterBackground:)
                                                              Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [module performSelector:sel
                     withObject:application];
#pragma clang diagnostic pop
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[SHRMAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(applicationWillEnterForeground:)
                                                              Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [module performSelector:sel withObject:application];
#pragma clang diagnostic pop
    }];
}




@end
