//
//  UIWindow+Mask.m
//  OA
//
//  Created by 樊小聪 on 16/6/28.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "UIWindow+Mask.h"
#import <objc/runtime.h>

#define KMASK_TAG 99999

@implementation UIWindow (Mask)

static char key;

/**
 *  给 UIWindow 添加 蒙板
 *
 *  @param frame          蒙板的位置
 *  @param didClickHandle 点击了蒙板之后的操作
 */
- (void)showMaskWithFrame:(CGRect)frame didClickHandle:(void(^)())didClickHandle
{
    UIView *mask = [[UIApplication sharedApplication].keyWindow viewWithTag:KMASK_TAG];
    
    if (!mask)
    {
        UIControl *mask      = [[UIControl alloc] init];
        mask.tag             = KMASK_TAG;
        mask.frame           = frame;
        mask.backgroundColor = [UIColor clearColor];
        
        objc_setAssociatedObject(self, &key, didClickHandle, OBJC_ASSOCIATION_COPY);
        
        [mask addTarget:self action:@selector(didClickMask:) forControlEvents:UIControlEventTouchUpInside];
        [[UIApplication sharedApplication].keyWindow addSubview:mask];
    }
}

- (void)didClickMask:(UIControl *)mask
{
    if (mask)
    {
        [mask removeFromSuperview];
        
        void(^didClickHandle)() = objc_getAssociatedObject(self, &key);
        
        if (didClickHandle)
        {
            didClickHandle();
        }
    }
}

- (void)dismissMask
{
    UIView *mask = [[UIApplication sharedApplication].keyWindow viewWithTag:KMASK_TAG];
    
    if (mask)
    {
        [mask removeFromSuperview];
    }
}

@end




