//
//  WKAppEventAnnotation.h
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef WKAppEventModSectName
#define WKAppEventModSectName "WKAppEventMods"
#endif

#define WKAppEventDATA(sectname) __attribute((used, section("__DATA,"#sectname" ")))

#define WKAppEventMod(name) \
char * k##name##_mod WKAppEventDATA(WKAppEventMods) = ""#name"";


NS_ASSUME_NONNULL_BEGIN

@interface WKAppEventAnnotation : NSObject

+ (NSArray<NSString *> *)AnnotationModules;

@end

NS_ASSUME_NONNULL_END
