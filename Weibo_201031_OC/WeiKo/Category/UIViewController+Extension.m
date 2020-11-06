//
//  UIViewController+Extension.m
//  OA
//
//  Created by 樊小聪 on 16/3/26.
//  Copyright © 2016年 Injoinow. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

+ (instancetype)viewControllerWithStoryboardName:(NSString *)name viewControllerIdentifier:(NSString *)identifier {
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

@end








