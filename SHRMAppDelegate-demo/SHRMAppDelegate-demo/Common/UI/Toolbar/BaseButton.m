//
//  BaseButton.m
//  APPEventModule
//
//  Created by 王凯 on 2019/2/13.
//  Copyright © 2019 王凯. All rights reserved.
//

#import "BaseButton.h"

@interface BaseButton ()
{
    CGRect contentRect;
}
@end

@implementation BaseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    {
        if (self)
        {
            contentRect = CGRectZero;
#ifdef UICONTROLAREA
            self.backgroundColor = [UIColor yellowColor];
#endif
        }
    }
    return self;
}

+ (id)buttonWithType:(UIButtonType)buttonType
{
    id tmp = [super buttonWithType:buttonType];
#ifdef UICONTROLAREA
    [(UIButton *)tmp setBackgroundColor:[UIColor yellowColor]];
#endif
    return tmp;
}

- (void)setContentArea:(CGRect)areaRect
{
    contentRect = areaRect;
}

- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
    if (CGRectIsEmpty(contentRect))
    {
        return bounds;
    }
    else
    {
        return contentRect;
    }
}

- (CGRect)contentRectForBounds:(CGRect)bounds
{
    if (CGRectIsEmpty(contentRect))
    {
        return bounds;
    }
    else
    {
        return contentRect;
    }
}


@end
