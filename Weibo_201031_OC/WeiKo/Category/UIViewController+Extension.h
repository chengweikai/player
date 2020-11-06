//
//  UIViewController+Extension.h
//  OA
//
//  Created by 樊小聪 on 16/3/26.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)


/**
 *  @brief 获取控制器
 *
 *  @param name       storyBoard 名称
 *  @param identifier viewController ID
 *
 *  @return viewController
 */
+ (instancetype)viewControllerWithStoryboardName:(NSString *)name viewControllerIdentifier:(NSString *)identifier;

@end











