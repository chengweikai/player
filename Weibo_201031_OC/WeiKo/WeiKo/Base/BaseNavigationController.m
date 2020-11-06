//
//  BaseViewController.h
//  WeiKo
//
//  Created by Vic on 2020/11/2.
//  Copyright © 2020 codeWalker. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIImage+Extension.h"
#import "UIColor+Util.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UINavigationBar *navBar = [UINavigationBar appearance];
    // 导航栏设置为不透明
    self.navigationBar.translucent = NO;
    // 导航栏字体颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"ffffff"],
                                     NSFontAttributeName:[UIFont systemFontOfSize:(18)]}];
    // 导航栏button字体和图片颜色
    [self.navigationBar setTintColor:[UIColor colorWithHexString:@"ffffff"]];
    // 导航栏背景颜色
    [self.navigationBar setBarTintColor:[UIColor colorWithHexString:@"0096ff"]];
    // 背景图片
    UIImage *bgImage = [UIImage imageForDefaultBackgroundImage];
    [self.navigationBar setShadowImage:bgImage];
    [self.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
