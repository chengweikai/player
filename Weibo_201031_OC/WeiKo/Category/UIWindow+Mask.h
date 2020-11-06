//
//  UIWindow+Mask.h
//  OA
//
//  Created by 樊小聪 on 16/6/28.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Mask)

/**
 *  给 UIWindow 添加 蒙板
 *
 *  @param frame          蒙板的位置
 *  @param didClickHandle 点击了蒙板之后的操作
 */
- (void)showMaskWithFrame:(CGRect)frame didClickHandle:(void(^)())didClickHandle;

/**
 *  隐藏 蒙板
 */
- (void)dismissMask;

@end
