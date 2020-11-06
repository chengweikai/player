//
//  UIViewController+HUD.m
//  OA
//
//  Created by Yigol on 16/3/21.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <objc/runtime.h>
#import <JGProgressHUD.h>

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

static NSString *const JGPHudHint = @" 加载中... ";

@implementation UIViewController (HUD)

- (JGProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(JGProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - ************ setupHUD
/** YES:Zoom  ; NO:Fade */
- (BOOL)zoom
{
    return NO;
}
/** 是否黑色背景 */
- (BOOL)dim
{
    return NO;
}
/** HUD是否带阴影 */
- (BOOL)shadow
{
    return NO;
}
/** HUD风格默认黑色 */
- (JGProgressHUDStyle )hudStyle
{
    return JGProgressHUDStyleDark;
}
/** 点击HUD的事件类型 */
- (JGProgressHUDInteractionType)interaction
{
    return JGProgressHUDInteractionTypeBlockAllTouches;
}

- (JGProgressHUD *)prototypeHUD {
    if ([self HUD]) {
        [[self HUD] dismissAnimated:NO];
    }
    JGProgressHUD *HUD = [[JGProgressHUD alloc] initWithStyle:[self hudStyle]];
    HUD.interactionType = [self interaction];
    if ([self zoom]) {
        JGProgressHUDFadeZoomAnimation *an = [JGProgressHUDFadeZoomAnimation animation];
        HUD.animation = an;
    }
    if ([self dim]) {
        HUD.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.4f];
    }
    if ([self shadow]) {
        HUD.HUDView.layer.shadowColor = [UIColor blackColor].CGColor;
        HUD.HUDView.layer.shadowOffset = CGSizeZero;
        HUD.HUDView.layer.shadowOpacity = 0.4f;
        HUD.HUDView.layer.shadowRadius = 8.0f;
    }
    return HUD;
}

#pragma mark - ************ Method
- (void)showHud
{
    [self showHudInView:self.view hint:JGPHudHint];
}

- (void)showHudInView:(UIView *)view
{
    [self showHudInView:view hint:JGPHudHint];
}

- (void)showHudWithHint:(NSString *)hint
{
    [self showHudInView:self.view hint:hint];
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint
{
    JGProgressHUD *HUD = self.prototypeHUD;
    HUD.textLabel.text = hint;
    [HUD showInView:view];
    [self setHUD:HUD];
}

- (void)showHint:(NSString *)hint
{
    JGProgressHUD *HUD = self.prototypeHUD;
    HUD.indicatorView = nil;
    HUD.textLabel.text = hint;
    HUD.position = JGProgressHUDPositionCenter;
    [HUD showInView:self.view];
    [HUD dismissAfterDelay:1.0];
}

- (void)showHint:(NSString *)hint InView:(UIView *)view {
    JGProgressHUD *HUD = self.prototypeHUD;
    HUD.indicatorView = nil;
    HUD.textLabel.text = hint;
    HUD.position = JGProgressHUDPositionCenter;
    [HUD showInView:view];
    [HUD dismissAfterDelay:1.0];
}

- (void)showErrorHud
{
    JGProgressHUD *HUD = self.prototypeHUD;
    HUD.textLabel.text = @"Error!";
    HUD.indicatorView = [[JGProgressHUDErrorIndicatorView alloc] init];
    HUD.square = YES;
    [HUD showInView:self.navigationController.view];
    [HUD dismissAfterDelay:2.0];
}

- (void)hideHud
{
    [[self HUD] dismiss];
}

/**
 *  显示成功的 hud
 *
 */
- (void)showSuccess:(NSString *)hint
{
    JGProgressHUD *HUD          = self.prototypeHUD;
    HUD.backgroundColor         = [UIColor colorWithWhite:0.f alpha:0.3];
    HUD.HUDView.backgroundColor = [UIColor blackColor];
    HUD.HUDView.alpha           = 0.8;
    HUD.textLabel.text          = hint;
    HUD.textLabel.font          = [UIFont systemFontOfSize:15];
    HUD.indicatorView           = [[JGProgressHUDSuccessIndicatorView alloc] init];
    HUD.square = YES;
    [HUD showInView:self.view];
    [HUD dismissAfterDelay:1.0];
}

/**
 *   显示错误的 hud
 *
 */
- (void)showError:(NSString *)hint
{
    JGProgressHUD *HUD          = self.prototypeHUD;
    HUD.backgroundColor         = [UIColor colorWithWhite:0.f alpha:0.3];
    HUD.HUDView.backgroundColor = [UIColor blackColor];
    HUD.HUDView.alpha           = 0.8;
    HUD.textLabel.text          = hint;
    HUD.textLabel.font          = [UIFont systemFontOfSize:15];
    HUD.indicatorView           = [[JGProgressHUDErrorIndicatorView alloc] init];
    HUD.square = YES;
    [HUD showInView:self.view];
    [HUD dismissAfterDelay:1.0];
}

/**
 *  显示警告的 hud
 *
 */
- (void)showWarning:(NSString *)hint
{
    JGProgressHUD *HUD          = self.prototypeHUD;
    HUD.backgroundColor         = [UIColor colorWithWhite:0.f alpha:0.3];
    HUD.HUDView.backgroundColor = [UIColor blackColor];
    HUD.HUDView.alpha           = 0.8;
    HUD.textLabel.font          = [UIFont systemFontOfSize:15];
    HUD.textLabel.text          = hint;
    HUD.indicatorView           = [[JGProgressHUDRingIndicatorView alloc] init];
    HUD.square = YES;
    [HUD showInView:self.view];
    [HUD dismissAfterDelay:1.0];
}

/**
 *  显示加载的 hud
 *
 */
- (void)showLoading:(NSString *)hint
{
//    JGProgressHUD *HUD          = self.prototypeHUD;
//    [self setHUD:HUD];
//    HUD.backgroundColor         = [UIColor colorWithWhite:0.f alpha:0.3];
//    HUD.HUDView.backgroundColor = [UIColor blackColor];
//    HUD.HUDView.alpha           = 0.8;
//    HUD.textLabel.font          = [UIFont systemFontOfSize:15];
//    HUD.textLabel.text          = hint;
//    HUD.indicatorView           = [[JGProgressHUDRingIndicatorView alloc] init];
//    HUD.square = YES;
//    [HUD showInView:self.view];
    
    [self showHudInView:self.view hint:hint];
}

@end














