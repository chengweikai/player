//
//  NSString+RegexAddition.h
//  BirdCar
//
//  Created by Yigol Chan on 15/6/1.
//  Copyright (c) 2015年 Injoinow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegexAddition)

/**
 *  Html文本
 *
 */
- (NSAttributedString *)htmlStr;


/**
 *  验证邮箱是不是可用
 *
 *  return YES / NO
 */
- (BOOL)isValidateEmail;

/**
 *  验证是不是数字
 *
 *  return YES / NO
 */
- (BOOL)isNumber;

/**
 *  验证是不是英文
 *
 *  return YES / NO
 */
- (BOOL)isEnglish;

/**
 *  验证是不是汉字
 *
 *  return YES / NO
 */
- (BOOL)isChinese;

/**
 *  验证是不是网络链接地址
 *
 *  return YES / NO
 */
- (BOOL)isInternetUrl;

/**
 *  是不是手机号码
 *
 *  @param mobileNum 手机号
 *
 *  @return YES / NO
 */

- (BOOL)isMobileNumber;


/**
 *  @brief md5 加密
 *
 *  @param string 需要加密的字符串
 *
 *  @return MD5 加密后的字符串
 */
+ (NSString *)md5:(NSString *)string;


// 密码加密
+ (NSString *)passwordEncryption:(NSString *)string;

+ (NSArray *)arrPasswordEncryption:(NSString *)string;

/** 限制非法字符 */
- (NSString *)limitIllegalCharacter;

@end
