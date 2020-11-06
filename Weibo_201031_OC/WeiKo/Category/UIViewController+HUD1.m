//
//  UIViewController+HUD1.m
//  Material
//
//  Created by Yigol on 16/10/27.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "UIViewController+HUD1.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

static NSString *const MBHudHint = @" 加载中... ";

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (HUD1)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


// ------ 图文
- (void)showHud {
    [self showHudInView:self.view hint:MBHudHint];
}

- (void)showHudInView:(UIView *)view{
    [self showHudInView:view hint:MBHudHint];
}

// common
- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor clearColor];
    hud.offset = CGPointMake(0.f, -40);//向上偏移
    hud.mode = MBProgressHUDModeCustomView;
    // customview
    NSMutableArray *imgsArr = [NSMutableArray array];
    for (NSInteger index = 0; index < 16; index ++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"loading%ld", index+1]];
        [imgsArr addObject:img];
    }
    UIImageView *imgView         = [[UIImageView alloc] init];
    imgView.contentMode          = UIViewContentModeScaleAspectFit;
    imgView.animationImages      = imgsArr;
    imgView.animationDuration    = imgsArr.count * 0.05;
    imgView.animationRepeatCount = 0;
    [imgView startAnimating];
    //imgView.frame = CGRectMake(0, 0, 75, 75);
    hud.customView = imgView;
    
    [self setHUD:hud];
}

// ------ 文字
- (void)showHint:(NSString *)hint {
//    UIView *win = [[UIApplication sharedApplication].delegate window];
    [self showHint:hint InView:self.view];
}

- (void)showHint:(NSString *)hint InView:(UIView *)view{
    if ([self HUD]) {
        [[self HUD] hideAnimated:YES];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
//    hud.label.text = hint;
//    hud.label.font = [UIFont systemFontOfSize:15];
//    hud.label.textColor = [UIColor whiteColor];
    hud.detailsLabel.text = hint;
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.1 alpha:0.9];
    hud.offset = CGPointMake(0.f, -40);//向上偏移
    //    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:1];
}


- (void)hideHud{
    [[self HUD] hideAnimated:YES];
}

@end
