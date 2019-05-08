//
//  MainView.h
//  APPEventModule
//
//  Created by 王凯 on 2019/2/13.
//  Copyright © 2019 王凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainToolbar.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainView : UIView
@property (nonatomic, strong) MainToolbar *mainToolbar;

- (id)initWithFrame:(CGRect)frame toolbarDelegate:(id<MainToolbarDelegate>)aDelegate;
@end

NS_ASSUME_NONNULL_END
