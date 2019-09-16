//
//  WKAppDelegate.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "WKAppDelegate.h"
#import "WKAppEventModuleManager.h"
#import "NSObject+AppEventModule.h"

@implementation WKAppDelegate

+ (void)load {
    [[WKAppEventModuleManager sharedInstance] registedAllModules];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[WKAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(application:didFinishLaunchingWithOptions:)
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
    
    [[WKAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(applicationDidEnterBackground:)
                                                              Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [module performSelector:sel
                     withObject:application];
#pragma clang diagnostic pop
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[WKAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(applicationWillEnterForeground:)
                                                              Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [module performSelector:sel withObject:application];
#pragma clang diagnostic pop
    }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
API_AVAILABLE(ios(7.0)){
    [[WKAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)
                                                              Complete:^(id module, SEL sel) {
         [module performSelector:sel
                      withObject:application
                      withObject:userInfo
                      withObject:completionHandler];
     }];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    __block BOOL result = YES;
    [[WKAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(application:
                                                                              openURL:
                                                                              sourceApplication:
                                                                              annotation:)
                                                           Complete:^(id module, SEL sel)
     {
         NSNumber *moduleRes = [module performSelector:sel
                                            withObject:application
                                            withObject:url
                                            withObject:sourceApplication
                                            withObject:annotation];
         result = [moduleRes boolValue];
     }];
    
    return result;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_4
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    __block BOOL result = YES;
    [[WKAppEventModuleManager sharedInstance] handleApplicationEvent:@selector(application:
                                                                              openURL:
                                                                              options:)
                                                           Complete:^(id module, SEL sel)
     {
         NSNumber *moduleRes = [module performSelector:sel
                                            withObject:app
                                            withObject:url
                                            withObject:options];
         result = [moduleRes boolValue];
     }];
    
    return result;
}
#endif


@end
