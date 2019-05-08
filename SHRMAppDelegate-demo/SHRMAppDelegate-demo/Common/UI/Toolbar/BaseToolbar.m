//
//  BaseToolbar.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/13.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "BaseToolbar.h"
#import "UIConfigDefine.h"

#define ToolbarItemGap 6

@implementation BaseToolbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGBAValue(0x0e, 0x17, 0x31, 0.85);
    }
    return self;
}


- (void)setItems:(NSArray *)aItems
{
    [aItems count];
    NSArray *tmpItems = [[NSArray alloc] initWithArray:aItems];
    [tmpItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIView *tmpItem = (UIView *)obj;
        CGRect itemFrame = [self getItemFrame:idx
                                        count:[aItems count]
                                        frame:tmpItem.frame];
        tmpItem.frame = itemFrame;
        [self addSubview:tmpItem];
    }];
}

- (CGRect)getItemFrame:(NSUInteger)aIndex count:(NSUInteger)aCount frame:(CGRect)aFrame
{
    CGRect itemFrame = CGRectZero;
    CGFloat itemWidth =  (ScreenWidth - (aCount + 1) * ToolbarItemGap) / aCount;
    itemFrame.size.height = aFrame.size.height;
    itemFrame.origin.y = (TOOLBAR_BASICHEIGHT - aFrame.size.height) / 2.0;
    if (aFrame.size.width < itemWidth)
    {
        itemFrame.size.width = aFrame.size.width;
        itemFrame.origin.x = aIndex * aFrame.size.width + (aIndex + 1) * (ScreenWidth - aCount * aFrame.size.width) / (aCount + 1);
    }
    else
    {
        itemFrame.size.width = itemWidth;
        itemFrame.origin.x = aIndex * itemWidth + (aIndex + 1) * ToolbarItemGap;
    }
    return itemFrame;
}

@end
