//
//  UIViewController+HUD.h
//  OA
//
//  Created by Yigol on 16/3/21.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

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

/**
 *  @brief 显示hud效果，加载在self.view上
 *
 *  @param hint 显示的文字内容
 */
- (void)showHudWithHint:(NSString *)hint;

/**
 *  @brief 显示hud
 *
 *  @param view SuperView
 *  @param hint 显示的文字内容
 */
- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

/**
 *  @brief 显示 文字
 *
 *  @param hint 文字内容
 */
- (void)showHint:(NSString *)hint;



- (void)showHint:(NSString *)hint InView:(UIView *)view;

/**
 *  @brief 显示错误信息的hud
 */
- (void)showErrorHud;

/**
 *  @brief hud消失
 */
- (void)hideHud;

/**
 *  显示成功的 hud
 *
 */
- (void)showSuccess:(NSString *)hint;

/**
 *   显示错误的 hud
 *
 */
- (void)showError:(NSString *)hint;

/**
 *  显示警告的 hud
 *
 */
- (void)showWarning:(NSString *)hint;

/**
 *  显示加载的 hud
 *
 */
- (void)showLoading:(NSString *)hint;

@end











