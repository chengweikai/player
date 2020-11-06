//
//  UIViewController+HUD1.h
//  Material
//
//  Created by Yigol on 16/10/27.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD1)


/**
 *  @brief 显示默认的hud效果，加载在self.view上
 */
- (void)showHud;

/**
 *  @brief 显示默认的hud效果
 *
 *  @param view SuperView
 */
- (void)showHudInView:(UIView *)view;

///**
// *  @brief  显示默认的hud效果，加载在self.view上
// *
// *  @param view 加载在self.view上
// *  @param hint 显示的文字内容
// */
//- (void)showHud:(NSString *)hint;

/**
 *  @brief 显示 文字
 *
 *  @param hint 文字内容
 */
- (void)showHint:(NSString *)hint;



- (void)showHint:(NSString *)hint InView:(UIView *)view;


- (void)hideHud;

@end
