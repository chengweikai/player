//
//  UIViewController+ShowAlert.h
//  HouNiaoJu
//
//  Created by Yigol Chan on 2017/1/20.
//  Copyright © 2017年 Yigol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowAlert)


// ------ 1 个 Action

- (void)showAlertrWithTitle:(NSString *)title;




- (void)showAlertrWithTitle:(NSString *)title
                    message:(NSString *)message
                 actionName:(NSString *)name
                    handler:(void (^)(UIAlertAction *action))handler;

// ------ 2 个 Action

- (void)showAlertrWithTitle:(NSString *)title
                    message:(NSString *)message
               okActionName:(NSString *)name
                  okHandler:(void (^)(UIAlertAction *action))handler;


- (void)showAlertrWithTitle:(NSString *)title
                    message:(NSString *)message
                action1Name:(NSString *)name1
                action2Name:(NSString *)name2
                   handler1:(void (^)(UIAlertAction *action))handler1
                   handler2:(void (^)(UIAlertAction *action))handler2;


@end
