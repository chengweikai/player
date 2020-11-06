
#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/** 返回一个只有年份的时间 */
- (NSDate *)dateWithYear;

/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

@end
