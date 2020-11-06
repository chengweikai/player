//
//  UIViewController+ShowAlert.m
//  HouNiaoJu
//
//  Created by Yigol Chan on 2017/1/20.
//  Copyright © 2017年 Yigol. All rights reserved.
//

#import "UIViewController+ShowAlert.h"

@implementation UIViewController (ShowAlert)

// ------ 1 个 Action
- (void)showAlertrWithTitle:(NSString *)title {
    
    [self showAlertrWithTitle:title message:nil actionName:@"确定" handler:nil];
}

- (void)showAlertrWithTitle:(NSString *)title
                    message:(NSString *)message
                 actionName:(NSString *)name
                    handler:(void (^)(UIAlertAction *action))handler {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:name style:UIAlertActionStyleDefault handler:handler];
//    [action setValue:COLOR_C8 forKey:@"titleTextColor"];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

// ------ 2 个 Action

- (void)showAlertrWithTitle:(NSString *)title
                    message:(NSString *)message
               okActionName:(NSString *)name
                  okHandler:(void (^)(UIAlertAction *action))handler {
    
    [self showAlertrWithTitle:title message:message action1Name:@"取消" action2Name:name handler1:nil handler2:handler];
}


- (void)showAlertrWithTitle:(NSString *)title
                    message:(NSString *)message
                action1Name:(NSString *)name1
                action2Name:(NSString *)name2
                   handler1:(void (^)(UIAlertAction *action))handler1
                   handler2:(void (^)(UIAlertAction *action))handler2 {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:name1 style:UIAlertActionStyleDefault handler:handler1];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:name2 style:UIAlertActionStyleDefault handler:handler2];
//    [action1 setValue:COLOR_C8 forKey:@"titleTextColor"];
//    [action2 setValue:COLOR_C8 forKey:@"titleTextColor"];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [self presentViewController:alertController animated:YES completion:nil];
}


@end
