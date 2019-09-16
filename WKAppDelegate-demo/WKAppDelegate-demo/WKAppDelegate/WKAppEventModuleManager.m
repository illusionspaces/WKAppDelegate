//
//  WKAppEventModuleManager.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "WKAppEventModuleManager.h"
#import "WKAppEventAnnotation.h"
#import "WKAppEventModuleProtocol.h"

#define kModuleInfoNameKey  @"moduleClass"
#define kModuleInfoLevelKey @"moduleLevel"

@implementation WKAppEventModuleManager

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public methods

- (void)registedAllModules {
    NSArray<NSString *>*mods = [WKAppEventAnnotation AnnotationModules];
    for (NSString *modName in mods)
    {
        if (modName)
        {
            Class moduleCls = NSClassFromString(modName);
            if (moduleCls && [moduleCls conformsToProtocol:@protocol(WKAppEventModuleProtocol)])
            {
                NSMutableDictionary *moduleInfo = [NSMutableDictionary dictionary];
                id<WKAppEventModuleProtocol> moduleInstance = [[moduleCls alloc] init];
                NSInteger levelInt = (NSInteger)[moduleInstance performSelector:@selector(moduleLevel)];
                [moduleInfo setObject:@(levelInt) forKey:kModuleInfoLevelKey];
                [moduleInfo setObject:moduleInstance forKey:kModuleInfoNameKey];
                [self.appEventModules addObject:moduleInfo];
            }
        }
    }
    
    [self.appEventModules sortUsingComparator:^NSComparisonResult(NSDictionary *module1, NSDictionary *module2) {
        NSNumber *module1Level = (NSNumber *)[module1 objectForKey:kModuleInfoLevelKey];
        NSNumber *module2Level =  (NSNumber *)[module2 objectForKey:kModuleInfoLevelKey];
        return [module1Level intValue] > [module2Level intValue];
    }];
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    [self.appEventModules enumerateObjectsUsingBlock:^(NSDictionary *module, NSUInteger idx, BOOL * _Nonnull stop) {
        id<WKAppEventModuleProtocol> moduleInstance = [module objectForKey:kModuleInfoNameKey];
        [tmpArray addObject:moduleInstance];
    }];
    
    [self.appEventModules removeAllObjects];
    [self.appEventModules addObjectsFromArray:tmpArray];
}

- (void)handleApplicationEvent:(SEL)eventSel
                      Complete:(void(^)(id module,SEL sel))complete {
    // appEventModules遍历Event过程中，module执行完可以将自己移除
    // 这里赋值为临时array，防止array遍历过程中移除自己导致出错
    NSMutableArray *tmpAppEventModules = [[NSMutableArray alloc] initWithArray:self.appEventModules];
    for (id<WKAppEventModuleProtocol>module in tmpAppEventModules)
    {
        if ([module conformsToProtocol:@protocol(WKAppEventModuleProtocol)])
        {
            if ([module respondsToSelector:eventSel]) {
                if (complete) {
                    complete(module,eventSel);
                }
            }
        }
    }
}

- (void)removeModule:(NSString *)moduleID {
    NSInteger index = NSNotFound;
    NSInteger resIndex = 0;
    for (id<WKAppEventModuleProtocol>module in self.appEventModules)
    {
        if ([[module moduleID] isEqualToString:moduleID])
        {
            index = resIndex;
            break;
        }
        resIndex++;
    }
    
    if (index != NSNotFound) {
        [self.appEventModules removeObjectAtIndex:index];
    }
}

#pragma mark - getter

- (NSMutableArray *)appEventModules {
    if (!_appEventModules) {
        _appEventModules = [NSMutableArray array];
    }
    return _appEventModules;
}

@end
