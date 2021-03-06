//
//  NSUserDefaults+YCAdd.m
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import "NSUserDefaults+YCAdd.h"

@implementation NSUserDefaults (YCAdd)

+ (NSArray *)typeList{
    return @[@"NSData", @"NSString", @"NSNumber", @"NSDate", @"NSArray", @"NSDictionary"];
}

+ (void)setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync{
    if (sync){
        [NSUbiquitousKeyValueStore.defaultStore setValue:value forKey:key];
    }
    [self setObject:value forKey:key];
}

+ (void)setObject:(id)value forKey:(NSString *)key{
    //添加数组支持
    NSArray * array = self.typeList;
    if (![array containsObject:NSStringFromClass([value class])])
        value = [NSKeyedArchiver archivedDataWithRootObject:value];//保存自定义对象
    [self.standardUserDefaults setObject:value forKey:key];
}

+ (id)objectForKey:(NSString *)key iCloudSync:(BOOL)sync{
    if (sync) {
        id value = [NSUbiquitousKeyValueStore.defaultStore valueForKey:key];
        [self.standardUserDefaults setValue:value forKey:key];
        [self.standardUserDefaults synchronize];
        return value;
    }
    return [self objectForKey:key];
}

+ (id)objectForKey:(NSString *)key{
    id obj = [self.standardUserDefaults objectForKey:key];
    if ([obj isKindOfClass:[NSData class]])
        obj = [NSKeyedUnarchiver unarchiveObjectWithData:obj];//解档自定义对象
    return obj;
}

+ (void)synchronizeAndCloudSync:(BOOL)sync{
    if (sync) {
        [NSUbiquitousKeyValueStore.defaultStore synchronize];
    }
    [self.standardUserDefaults synchronize];
}

+ (void)synchronize{
    [self synchronizeAndCloudSync:NO];
}

+ (void)setArcObject:(id)value forKey:(NSString *)key {
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:value];
    [self.standardUserDefaults setObject:data forKey:key];
}

+ (id)arcObjectForKey:(NSString *)key {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[NSUserDefaults.standardUserDefaults objectForKey:key]];
}


@end
