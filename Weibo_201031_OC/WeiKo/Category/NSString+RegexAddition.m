//
//  NSString+RegexAddition.m
//  BirdCar
//
//  Created by Yigol Chan on 15/6/1.
//  Copyright (c) 2015年 Injoinow. All rights reserved.
//

#import "NSString+RegexAddition.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

#define REGULAR_FILE_NAME @"Regular"

// 判断邮件格式正则表达式
#define EMAIL_REGEX_NAME @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"

// 判断数字正则表达式
#define NUMBER_REGEX_NAME @"^[0-9]*$"

// 判断英文正则表达式
#define ENGLISH_REGEX_NAME @"^[A-Za-z]+$"

// 判断中文正则表达式
#define CHINESE_REGEX_NAME @"^[\u4e00-\u9fa5],{0,}$"

// 判断网址正则表达式
#define INTERNET_URL_REGEX_NAME @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"

//判断手机正则表达式
//#define PHONE_REGEX_NAME @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,0-9]))\\d{8}$"
#define PHONE_REGEX_NAME @"^[0-9]{11}"

@implementation NSString (RegexAddition)

/**
 *  加载富文本
 */
- (NSAttributedString *)htmlStr
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithData:[self dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attrStr.length-1)];
    
    return attrStr;
}

// 邮件
- (BOOL)isValidateEmail
{
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", EMAIL_REGEX_NAME];
    return [regex evaluateWithObject:self];
}

// 数字
- (BOOL)isNumber
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NUMBER_REGEX_NAME];
    return [predicate evaluateWithObject:self];
}

// 英文
- (BOOL)isEnglish
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ENGLISH_REGEX_NAME];
    return [predicate evaluateWithObject:self];
}

// 汉字
- (BOOL)isChinese
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CHINESE_REGEX_NAME];
    return [predicate evaluateWithObject:self];
}

// 网址
- (BOOL)isInternetUrl
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", INTERNET_URL_REGEX_NAME];
    return [predicate evaluateWithObject:self];
}

// 手机号码

- (BOOL)isMobileNumber

{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHONE_REGEX_NAME];
    return [predicate evaluateWithObject:self];
}


+ (NSString *)md5:(NSString *)string {
    if (string == nil || [string length] == 0) {
        return nil;
    }
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([string UTF8String], (int)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }
    
    return [ms copy];
}


+ (NSString *)passwordEncryption:(NSString *)string {
    
    // md5加密
    NSString *md5Str = [NSString md5:string];
    // 追加随机6位字符串
    char data[6];
    for (int i = 0; i < 6; data[i++] = (char)('a' + (arc4random_uniform(26))));
    NSString *randomStr = [[NSString alloc] initWithBytes:data length:6 encoding:NSUTF8StringEncoding];
    // 再次md5加密
    NSString *newStr = [NSString md5:[md5Str stringByAppendingString:randomStr]];
    
    return newStr;
}

+ (NSArray *)arrPasswordEncryption:(NSString *)string {
    
    NSMutableArray *tempArr = [NSMutableArray array];
    // md5加密
    NSString *md5Str = [NSString md5:string];
    // 追加随机6位字符串
    char data[6];
    for (int i = 0; i < 6; data[i++] = (char)('a' + (arc4random_uniform(26))));
    NSString *randomStr = [[NSString alloc] initWithBytes:data length:6 encoding:NSUTF8StringEncoding];
    
    [tempArr addObject:randomStr];
    
    // 再次md5加密
    NSString *newStr = [NSString md5:[md5Str stringByAppendingString:randomStr]];
    
    [tempArr addObject:newStr];
    
    return [tempArr copy];
}

- (NSString *)limitIllegalCharacter {
    //合法字符集合
    //    NSCharacterSet *legalPunctuationCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@",.·，。•、"];
    //英文和数字字符集合
    NSCharacterSet *alphanumericCharacterSet = [NSCharacterSet alphanumericCharacterSet];
    //中文字符集合
    NSCharacterSet *chineseSet = [NSString ttChineseSet];
    
    //合法字符  英文和数字字符 中文字符 并集的集合
    NSMutableCharacterSet *characterSet  = [[NSMutableCharacterSet alloc] init];
    //        [characterSet formUnionWithCharacterSet:legalPunctuationCharacterSet];
    [characterSet formUnionWithCharacterSet:alphanumericCharacterSet];
    [characterSet formUnionWithCharacterSet:chineseSet];
    
    // 除去合法字符  英文和数字字符 中文字符 并集的集合的补集
    NSCharacterSet *illegalCharacterSet = characterSet.invertedSet;
    
    // 将非法字符过滤成 @""
    NSString *legalNickName = [[self componentsSeparatedByCharactersInSet:illegalCharacterSet] componentsJoinedByString:@""];
    
    return legalNickName;
}

+ (NSCharacterSet *)ttChineseSet
{
    // 中文字符集合
    static NSCharacterSet *chineseSet;
    if (chineseSet == nil)
    {
        NSMutableCharacterSet *aCharacterSet = [[NSMutableCharacterSet alloc] init];
        
        NSRange lcEnglishRange;
        lcEnglishRange.location = (unsigned int)0x4e00;
        lcEnglishRange.length = (unsigned int)0x9fa5 - (unsigned int)0x4e00;
        [aCharacterSet addCharactersInRange:lcEnglishRange];
        chineseSet = aCharacterSet;
    }
    return chineseSet;
}

@end
