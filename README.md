# SHRMAppDelegate

[![Version](https://img.shields.io/cocoapods/v/SHRMAppDelegate.svg?style=flat)](http://cocoapods.org/pods/SHRMAppDelegate)
[![Pod License](http://img.shields.io/cocoapods/l/SHRMAppDelegate.svg?style=flat)](https://opensource.org/licenses/MIT)
![iOS 6.0+](https://img.shields.io/badge/iOS-6.0%2B-blue.svg)
![](https://img.shields.io/badge/language-objc-orange.svg)
![ARC](https://img.shields.io/badge/ARC-orange.svg)

## Link
* Blog : [AppDelegate的模块化+瘦身](https://juejin.im/post/5c62caf6e51d457fc905dd75)

## 介绍
**一个对APPDelegate深度解耦的逻辑，教你实现APPDelegate模块化拆分，原本上千行的代码可以简化到10行内，使用方便，极少的代码浸入。支持iOS6+**

**AppDelegate简化后的样子：**

```objc
#import "SHRMAppDelegate.h"
@interface AppDelegate : SHRMAppDelegate
@property (strong, nonatomic) UIWindow *window;
@end
```
```objc
#import "MainViewController.h"
@implementation AppDelegate
@synthesize window;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
[super application:application didFinishLaunchingWithOptions:launchOptions];
[self initMainController];
return YES;
}

- (void)initMainController {
self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
self.window.backgroundColor = [UIColor whiteColor];
self.window.rootViewController = [[MainViewController alloc] init];
[self.window makeKeyAndVisible];
}
@end
```
**你没看错，引入框架后，你的AppDelegate只有这些代码！怎么做的？看demo。**

## 特性

- 搭积木式设计。
- `AppDelegate.m`内的代码精简到10行内。
- 原有的功能模块拆分为单独的子模块，模块独立，模块间无耦合。
- 每个模块都拥有自己的生命周期，目前支持模块的初始化->销毁。
- 模块可自定义执行的优先级，也就是说可以自定义原`AppDelegate`中不同业务功能的加载顺序。
- 模块扩展性高，易于维护，新需求只需新增模块即可，顺便在模块内部管理下该模块的生命周期。
- 代码可读性强，每个模块只负责该模块内的业务。
- 模块支持插拔，需要就拖到项目中，不需要删除也不影响项目build！
- 其他特性demo中自己挖掘。

## 安装

### 1.CocoaPods
1. 在 Podfile 中添加 `pod 'SHRMAppDelegate', '~> 0.0.2'`。
2. 执行 `pod install` 或 `pod update`。
3. 在AppDelegate中导入 `<SHRMAppDelegate.h>`并继承。


### 2.手动导入

下载SHRMAppDelegate文件夹，将SHRMAppDelegate文件夹拖入到你的工程中。

## 用法

- `SHRMAppDelegate`为对外暴漏的主体类，内部实现了所有的App生命周期方法，当然你也可以指定实现哪一类方法，或者不需要框架实现，只需要在你的`AppDelegate`中重写即可。
- `SHRMAppEventModuleManager`是模块的管理类，管理着所有注册过的模块。
- `SHRMBaseAppEventModule`是所有模块需要继承的基类，为所有模块提供公共方法，包括模块执行顺序，模块生命周期管理等，可自行扩充。
- `SHRMAppEventAnnotation`为模块注册专用类，每个模块都需要注册的，为什么注册？不注册怎么管理呢。

### 1.`AppDelegate`继承`SHRMAppDelegate`，让`SHRMAppDelegate`来接管App的生命周期函数。
### 2.创建插件，继承`SHRMBaseAppEventModule`：

```objc
#import "SHRMBaseAppEventModule.h"

@interface testMudule : SHRMBaseAppEventModule

@end
```
```objc
SHRMAppEventMod(testMudule)

@implementation testMudule

// 该插件执行顺序
- (NSInteger)moduleLevel {
return 1;
}

//该插件需要在didFinishLaunchingWithOptions:生命周期函数中做些操作
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//插件初始化
[self initMudule];
//插件销毁，父类实现
[self destroyModule];
return YES;
}

- (void)initMudule {
NSLog(@"testMudule init");
}

@end
```
**插件概念：每个插件都为独立的业务，比如程序启动后的数据库处理、定位处理等都可以定义为一个插件，让插件继承`SHRMBaseAppEventModule`插件就会被管理。如果想在程序启动的时候执行该插件就在该插件里面重写`didFinishLaunchingWithOptions:`即可，如上。如果想在程序进入后台执行该插件的一些业务那么只需要重写`applicationDidEnterBackground:`即可，然后在该函数里面进行业务处理。**

### 3.详细使用请参照demo，如有疑问欢迎issue，欢迎star。

## License

SHRMAppDelegate is available under the MIT License. See the [LICENSE](https://github.com/GitWangKai/SHRMAppDelegate/blob/master/LICENSE) file for more info.

