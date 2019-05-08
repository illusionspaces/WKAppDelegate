//
//  MainToolbar.h
//  APPEventModule
//
//  Created by 王凯 on 2019/2/13.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "BaseToolbar.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MainToolbarDelegate <NSObject>

- (void)toolbarButtonClick:(id)sender;

@end

@interface MainToolbar : BaseToolbar
@property (nonatomic, weak) id<MainToolbarDelegate> toolbarDelegate;
@end

NS_ASSUME_NONNULL_END
