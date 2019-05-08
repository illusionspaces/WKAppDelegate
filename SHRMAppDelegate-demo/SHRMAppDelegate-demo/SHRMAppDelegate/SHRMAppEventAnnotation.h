//
//  SHRMAppEventAnnotation.h
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef SHRMAppEventModSectName
#define SHRMAppEventModSectName "SHRMAppEventMods"
#endif

#define SHRMAppEventDATA(sectname) __attribute((used, section("__DATA,"#sectname" ")))

#define SHRMAppEventMod(name) \
char * k##name##_mod SHRMAppEventDATA(SHRMAppEventMods) = ""#name"";


NS_ASSUME_NONNULL_BEGIN

@interface SHRMAppEventAnnotation : NSObject

+ (NSArray<NSString *> *)AnnotationModules;

@end

NS_ASSUME_NONNULL_END
