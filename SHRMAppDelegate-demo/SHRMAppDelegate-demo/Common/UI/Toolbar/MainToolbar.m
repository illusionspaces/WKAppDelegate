//
//  MainToolbar.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/13.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "MainToolbar.h"
#import "BaseButton.h"
#import "UIConfigDefine.h"

@interface MainToolbar ()
@property (nonatomic, strong) BaseButton *focusButton;

- (void)initViews;
- (void)onToolbarButtonClick:(id)sender;
@end

@implementation MainToolbar

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = UIColorFromRGBAValue(0x0e, 0x17, 0x31, 0.85);
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    CGRect toolbarButtonFrame = CGRectMake(0, 0, 80, 48);
    BaseButton *firstButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = toolbarButtonFrame;
    [firstButton setImage:[UIImage imageNamed:@"invest_nor"]
                 forState:UIControlStateNormal];
    [firstButton setImage:[UIImage imageNamed:@"invest_sel"]
                 forState:UIControlStateSelected];
    firstButton.tag = TOOLBAR_TAG_FIRST;
    [firstButton addTarget:self
                    action:@selector(onToolbarButtonClick:)
          forControlEvents:UIControlEventTouchDown];
    
    BaseButton *secondButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = toolbarButtonFrame;
    [secondButton setImage:[UIImage imageNamed:@"account_nor"]
                  forState:UIControlStateNormal];
    [secondButton setImage:[UIImage imageNamed:@"account_sel"]
                  forState:UIControlStateSelected];
    secondButton.tag = TOOLBAR_TAG_SECOND;
    [secondButton addTarget:self
                     action:@selector(onToolbarButtonClick:)
           forControlEvents:UIControlEventTouchDown];
    
    BaseButton * thirdButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    thirdButton.frame = toolbarButtonFrame;
    [thirdButton setImage:[UIImage imageNamed:@"register_nor"]
                 forState:UIControlStateNormal];
    [thirdButton setImage:[UIImage imageNamed:@"register_sel"]
                 forState:UIControlStateSelected];
    thirdButton.tag = TOOLBAR_TAG_THIRD;
    [thirdButton addTarget:self
                    action:@selector(onToolbarButtonClick:)
          forControlEvents:UIControlEventTouchDown];
    
    BaseButton * fourthButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    fourthButton.frame = toolbarButtonFrame;
    [fourthButton setImage:[UIImage imageNamed:@"setting_nor"]
                  forState:UIControlStateNormal];
    [fourthButton setImage:[UIImage imageNamed:@"setting_sel"]
                  forState:UIControlStateSelected];
    fourthButton.tag = TOOLBAR_TAG_FOURTH;
    [fourthButton addTarget:self
                     action:@selector(onToolbarButtonClick:)
           forControlEvents:UIControlEventTouchDown];
    
    NSArray* itemArray = @[firstButton, secondButton, thirdButton, fourthButton];
    
    self.items = itemArray;
    
//    switch ([FireflyGlobalVar sharedInstance].launchPage) {
//        case 0:
//            firstButton.selected = YES;
//            self.focusButton = firstButton;
//            break;
//        case 1:
//            secondButton.selected = YES;
//            self.focusButton = secondButton;
//            break;
//        case 2:
//            thirdButton.selected = YES;
//            self.focusButton = thirdButton;
//            break;
//        case 3:
//            fourthButton.selected = YES;
//            self.focusButton = fourthButton;
//            break;
//        default:
//            break;
//    }
}

- (void)onToolbarButtonClick:(id)sender
{
    BaseButton *button = (BaseButton *)sender;
    if (button.tag != self.focusButton.tag)
    {
        self.focusButton.selected = NO;
        button.selected = YES;
        self.focusButton = button;
        
        if (self.toolbarDelegate && [self.toolbarDelegate respondsToSelector:@selector(toolbarButtonClick:)])
        {
            [self.toolbarDelegate toolbarButtonClick:sender];
        }
    }
}

@end
