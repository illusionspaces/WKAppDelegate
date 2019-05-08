//
//  testRemoteNotificationModule.m
//  SHRMAppDelegate-demo
//
//  Created by Kevin on 2019/5/8.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "testRemoteNotificationModule.h"

SHRMAppEventMod(testRemoteNotificationModule)

@implementation testRemoteNotificationModule

- (NSInteger)moduleLevel {
    return 3;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    [self performSelector:@selector(handleNotification:)
               withObject:userInfo
               afterDelay:0.3];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)handleNotification:(NSDictionary *)userInfo {
    //处理推送 消息
    NSString *payloadStr = userInfo[@"userInfo"];
    NSLog(@"%@",payloadStr);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"REMOTE_NOTIFICATION"
                                                        object:nil
                                                      userInfo:userInfo];
}



@end
