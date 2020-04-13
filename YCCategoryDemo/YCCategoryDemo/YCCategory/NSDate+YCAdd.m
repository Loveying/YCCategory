//
//  NSDate+YCAdd.m
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import "NSDate+YCAdd.h"

static NSString * YC_CalendarCustomIdentifierConstant = nil;
#define YC_SharedCalendar (YC_CalendarCustomIdentifierConstant)?[NSCalendar calendarWithIdentifier:YC_CalendarCustomIdentifierConstant] : [NSCalendar currentCalendar]

@implementation NSDate (YCAdd)

+ (void)yc_configTheDefaultCalendarWithIdentifier:(NSCalendarIdentifier)calendarIdentifierConstant {
    YC_CalendarCustomIdentifierConstant = calendarIdentifierConstant;
}

// 根据年月日生成日期
+ (nullable NSDate *)yc_dateFromYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minutes:(NSInteger)minutes Seconds:(NSInteger)seconds {
    NSDateComponents * comps = [[NSDateComponents alloc] init];
    [comps setValue:year forComponent:NSCalendarUnitYear];
    [comps setValue:month forComponent:NSCalendarUnitMonth];
    [comps setValue:day forComponent:NSCalendarUnitDay];
    [comps setValue:hour forComponent:NSCalendarUnitHour];
    [comps setValue:minutes forComponent:NSCalendarUnitMinute];
    [comps setValue:seconds forComponent:NSCalendarUnitSecond];
    return [self yc_dateFromComponents:comps];
}

+ (nullable NSDate *)yc_dateFromComponents:(NSDateComponents *)comps {
    return [YC_SharedCalendar dateFromComponents:comps];
}

// 调整时间获取日期 第一个参数传负值相当于获取之前的日期
- (nullable NSDate *)yc_dateByAddingSeconds:(NSInteger)seconds {
    return [YC_SharedCalendar dateByAddingUnit:NSCalendarUnitSecond value:seconds toDate:self options:NSCalendarMatchStrictly];
}

- (nullable NSDate *)yc_dateByAddingMinutes:(NSInteger)minutes {
    return [YC_SharedCalendar dateByAddingUnit:NSCalendarUnitMinute value:minutes toDate:self options:NSCalendarMatchStrictly];
}

- (nullable NSDate *)yc_dateByAddingHours:(NSInteger)hours {
    return [YC_SharedCalendar dateByAddingUnit:NSCalendarUnitHour value:hours toDate:self options:NSCalendarMatchStrictly];
}

- (nullable NSDate *)yc_dateByAddingMonths:(NSInteger)months {
    return [YC_SharedCalendar dateByAddingUnit:NSCalendarUnitMonth value:months toDate:self options:NSCalendarMatchStrictly];
}

- (nullable NSDate *)yc_dateByAddingDays:(NSInteger)days {
    return [YC_SharedCalendar dateByAddingUnit:NSCalendarUnitDay value:days toDate:self options:NSCalendarMatchStrictly];
}

- (nullable NSDate *)yc_dateByAddingYears:(NSInteger)year {
    return [YC_SharedCalendar dateByAddingUnit:NSCalendarUnitYear value:year toDate:self options:NSCalendarMatchStrictly];
}

- (nullable NSDate *)yc_dateByAddingComponents:(NSDateComponents *)comps {
    return [YC_SharedCalendar dateByAddingComponents:comps toDate:self options:NSCalendarMatchStrictly];
}

// 获取日期的开始时间 例：2018-09-09 00：00：00
- (nullable NSDate *)yc_startOfDay {
    return [YC_SharedCalendar startOfDayForDate:self];
}

// 获取日期的年月日时分秒
- (NSInteger)yc_seconds {
    return [YC_SharedCalendar component:NSCalendarUnitSecond fromDate:self];
}

- (NSInteger)yc_minute {
    return [YC_SharedCalendar component:NSCalendarUnitMinute fromDate:self];
}

- (NSInteger)yc_hour {
    return [YC_SharedCalendar component:NSCalendarUnitHour fromDate:self];
}

- (NSInteger)yc_day {
    return [YC_SharedCalendar component:NSCalendarUnitDay fromDate:self];
}

- (NSInteger)yc_month {
    return [YC_SharedCalendar component:NSCalendarUnitMonth fromDate:self];
}

- (NSInteger)yc_week {
    return [YC_SharedCalendar component:NSCalendarUnitWeekday fromDate:self];
}

- (NSInteger)yc_year {
    return [YC_SharedCalendar component:NSCalendarUnitYear fromDate:self];
}

// 简单的时间字符串
- (NSString *)yc_weekDays {
    NSInteger week = [self yc_week];
    NSString * weekString = @"";
    switch (week) {
        case 1:
            weekString = @"星期日";
            break;
        case 2:
            weekString = @"星期一";
            break;
        case 3:
            weekString = @"星期二";
            break;
        case 4:
            weekString = @"星期三";
            break;
        case 5:
            weekString = @"星期四";
            break;
        case 6:
            weekString = @"星期五";
            break;
        case 7:
            weekString = @"星期六";
            break;
            
        default:
            break;
    }
    return weekString;
}

- (NSString *)yc_timesString {
    
    NSString * dateString = [self yc_stringWithFormat:@"yyyy-MM-dd"];
    NSString * timeString = [self yc_stringWithFormat:@"HH:mm"];
    NSString * preStr = dateString;
    BOOL isToday = [self yc_isToday];
    BOOL isTommorrow = [self yc_isTomorrow];
    BOOL isYesterDay = [self yc_isYesterDay];
    
    if (isToday) {
        preStr = @"今天";
    }
    else if (isTommorrow) {
        preStr = @"明天";
    }
    else if (isYesterDay) {
        preStr = @"昨天";
    }
    
    return [NSString stringWithFormat:@"%@ %@",preStr,timeString];
}

- (NSString *)yc_timesAgo {
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self];
    if (timeInterval < 0) {
        return @"";
    }
    if (timeInterval < 60) {
        return @"刚刚";
    }
    else if (timeInterval >= 60 && timeInterval < 60*60) {
        return [NSString stringWithFormat:@"%.0f分钟前",timeInterval/60];
    }
    else if (timeInterval >= 60*60 && timeInterval < 24*60*60) {
        return [NSString stringWithFormat:@"%.0f小时前",timeInterval/(60*60)];
    }
    else {
        return [self yc_timesString];
    }
}

// 是否和某个日期一样
- (BOOL)yc_isSameAsDate:(NSDate *)anotherDate {
    return [self compare:anotherDate] == NSOrderedSame;
}

- (BOOL)yc_isSameAsDate:(NSDate *)anotherDate inSomeUnit:(NSCalendarUnit)unit {
    return [YC_SharedCalendar isDate:anotherDate equalToDate:self toUnitGranularity:unit];
}

- (BOOL)yc_isToday {
    return [YC_SharedCalendar isDateInToday:self];
}

- (BOOL)yc_isYesterDay {
    return [YC_SharedCalendar isDateInYesterday:self];
}

- (BOOL)yc_isTomorrow {
    return [YC_SharedCalendar isDateInTomorrow:self];
}

- (BOOL)yc_isWeekend {
    return [YC_SharedCalendar isDateInWeekend:self];
}

+ (nullable NSDate *)yc_earlierDate:(NSArray<NSDate *> *)dates {
    NSDate * earlierDate = nil;
    NSInteger totalCount = dates.count;
    for (NSInteger i = 0; i < totalCount; i++) {
        if (i == 0) {
            earlierDate = dates[i];
            break;
        }
        NSDate * currentDate = dates[i];
        earlierDate = [earlierDate earlierDate:currentDate];
    }
    return earlierDate;
}

+ (nullable NSDate *)yc_laterDate:(NSArray<NSDate *> *)dates {
    NSDate * laterDate = nil;
    NSInteger totalCount = dates.count;
    for (NSInteger i = 0; i < totalCount; i++) {
        if (i == 0) {
            laterDate = dates[i];
            break;
        }
        NSDate * currentDate = dates[i];
        laterDate = [laterDate laterDate:currentDate];
    }
    return laterDate;
}

// 时间字符串和日期相互转换
- (nullable NSString *)yc_stringWithFormat:(NSString *)format {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    formatter.calendar = YC_SharedCalendar;
    return [formatter stringFromDate:self];
}

+ (nullable NSDate *)yc_dateFromString:(NSString *)timeString WithTimeFormat:(NSString *)format {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    formatter.calendar = YC_SharedCalendar;
    return [formatter dateFromString:timeString];
}

// 根据时间戳生成日期
+ (nullable NSDate *)yc_dateFromTimestamp:(NSTimeInterval)timestamp {
    if (timestamp >= 1000000000 && timestamp < 10000000000) { // 10位
        return [NSDate dateWithTimeIntervalSince1970:timestamp];
    }
    else if (timestamp >= 1000000000000 && timestamp < 10000000000000) { // 13位
        return [NSDate dateWithTimeIntervalSince1970:timestamp/1000.0];
    }
    return nil;
}

// 判断日期是否在所给日期范围内
- (BOOL)isContainedBetweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    NSComparisonResult startResult = [startDate compare:self];
    NSComparisonResult endResult = [endDate compare:self];
    return (startResult != NSOrderedDescending && endResult != NSOrderedAscending);
}

- (BOOL)isContainedInStartDate:(NSDate *)startDate andDuration:(NSTimeInterval)timeInterval {
    NSDate * endDate = [startDate dateByAddingTimeInterval:timeInterval];
    return [self isContainedBetweenStartDate:startDate andEndDate:endDate];
}


@end
