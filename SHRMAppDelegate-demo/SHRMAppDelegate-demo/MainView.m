//
//  MainView.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/13.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "MainView.h"
#import "UIConfigDefine.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame toolbarDelegate:(id<MainToolbarDelegate>)aDelegate
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor redColor];
        CGRect toolbarFrame = CGRectMake(0, frame.size.height - TOOLBAR_HEIGHT, frame.size.width, TOOLBAR_HEIGHT);
        MainToolbar *toolbar = [[MainToolbar alloc] initWithFrame:toolbarFrame];
        //        toolbar.delegate = aDelegate;
        toolbar.toolbarDelegate = aDelegate;
        self.mainToolbar = toolbar;
        [self addSubview:toolbar];
    }
    return self;
}

@end
