//
//  MainViewController.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/12.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "MainViewController.h"
#import "UIConfigDefine.h"
#import "MainView.h"
#import "HomeController.h"
#import "MyViewController.h"
#import "ComponentController.h"
#import "SetViewController.h"
#import "BaseButton.h"

@interface MainViewController ()<MainToolbarDelegate>
@property (nonatomic, strong) MainView *mainView;
@property (nonatomic, strong) UIView *focusView;
@property (nonatomic, strong) HomeController *homeController;
@property (nonatomic, strong) MyViewController *myController;
@property (nonatomic, strong) ComponentController *componentController;
@property (nonatomic, strong) SetViewController *setController;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMainView];
}

- (void)initMainView {
    self.mainView = [[MainView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64)
                                            toolbarDelegate:(id<MainToolbarDelegate>)self];
    [self.view addSubview:self.mainView];
    
    HomeController *homeController = [[HomeController alloc] init];
    self.homeController = homeController;
    [self addChildViewController:self.homeController];
    
    MyViewController *myController = [[MyViewController alloc] init];
    self.myController = myController;
    [self addChildViewController:self.myController];
    
    ComponentController *componentController = [[ComponentController alloc] init];
    self.componentController = componentController;
    [self addChildViewController:self.componentController];
    
    SetViewController *setController = [[SetViewController alloc] init];
    self.setController = setController;
    [self addChildViewController:self.setController];

    self.focusView = self.homeController.view;
    [self.mainView insertSubview:self.focusView
                    belowSubview:self.mainView.mainToolbar];
}

#pragma mark - MainToolbarDelegate
- (void)toolbarButtonClick:(id)sender
{
    BaseButton *button = (BaseButton *)sender;
    [self.focusView removeFromSuperview];
    
    switch (button.tag)
    {
        case TOOLBAR_TAG_FIRST:
        {
            self.focusView = self.homeController.view;
        }
            break;
        case TOOLBAR_TAG_SECOND:
        {
            self.focusView = self.myController.view;
//            [self.testRYBViewController recoverBusinessData];
        }
            break;
        case TOOLBAR_TAG_THIRD:
        {
            self.focusView = self.componentController.view;
//            [self.testJSWebviewController reloadPage];
        }
            break;
        case TOOLBAR_TAG_FOURTH:
        {
            self.focusView = self.setController.view;
        }
            break;
        default:
            break;
    }
    
    [self.mainView addSubview:self.focusView];
    [self.mainView insertSubview:self.focusView
                        belowSubview:self.mainView.mainToolbar];
}


@end
