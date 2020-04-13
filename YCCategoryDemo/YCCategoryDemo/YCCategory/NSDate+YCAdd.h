//
//  NSDate+YCAdd.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (YCAdd)

/**
 配置默认的日历 ，如果不调用该方法，默认使用的是用户系统设置的日历
 @param calendarIdentifierConstant 各个区域的日历参数
 */
+ (void)yc_configTheDefaultCalendarWithIdentifier:(NSCalendarIdentifier)calendarIdentifierConstant;

// 根据年月日生成日期
+ (nullable NSDate *)yc_dateFromYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minutes:(NSInteger)minutes Seconds:(NSInteger)seconds;
+ (nullable NSDate *)yc_dateFromComponents:(NSDateComponents *)comps;

// 调整时间获取日期 第一个参数传负值相当于获取之前的日期
- (nullable NSDate *)yc_dateByAddingSeconds:(NSInteger)seconds;
- (nullable NSDate *)yc_dateByAddingMinutes:(NSInteger)minutes;
- (nullable NSDate *)yc_dateByAddingHours:(NSInteger)hours;
- (nullable NSDate *)yc_dateByAddingMonths:(NSInteger)months;
- (nullable NSDate *)yc_dateByAddingDays:(NSInteger)days;
- (nullable NSDate *)yc_dateByAddingYears:(NSInteger)year;
- (nullable NSDate *)yc_dateByAddingComponents:(NSDateComponents *)comps;

// 获取日期的开始时间 例：2018-09-09 00：00：00
- (nullable NSDate *)yc_startOfDay;

// 获取日期的年月日时分秒
- (NSInteger)yc_seconds;
- (NSInteger)yc_minute;
- (NSInteger)yc_hour;
- (NSInteger)yc_day;
- (NSInteger)yc_month;
- (NSInteger)yc_week;
- (NSInteger)yc_year;

// 简单的时间字符串
- (NSString *)yc_weekDays;
- (NSString *)yc_timesString;
- (NSString *)yc_timesAgo;

// 是否和某个日期一样
- (BOOL)yc_isSameAsDate:(NSDate *)anotherDate;
- (BOOL)yc_isSameAsDate:(NSDate *)anotherDate inSomeUnit:(NSCalendarUnit)unit;

- (BOOL)yc_isToday;
- (BOOL)yc_isYesterDay;
- (BOOL)yc_isTomorrow;
- (BOOL)yc_isWeekend;

+ (nullable NSDate *)yc_earlierDate:(NSArray<NSDate *> *)dates;// 获取数组里最小的时间
+ (nullable NSDate *)yc_laterDate:(NSArray<NSDate *> *)dates;// 获取数组里最大的时间

// 时间字符串和日期相互转换
- (nullable NSString *)yc_stringWithFormat:(NSString *)format;
+ (nullable NSDate *)yc_dateFromString:(NSString *)timeString WithTimeFormat:(NSString *)format;

// 根据时间戳生成日期 一般时间戳都是10位或13位，这里只考虑10位或13位的情况
+ (nullable NSDate *)yc_dateFromTimestamp:(NSTimeInterval)timestamp;

// 判断日期是否在所给日期范围内
- (BOOL)isContainedBetweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;
- (BOOL)isContainedInStartDate:(NSDate *)startDate andDuration:(NSTimeInterval)timeInterval;

@end

NS_ASSUME_NONNULL_END
