//
//  NSUserDefaults+YCAdd.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (YCAdd)

@property (class, nonatomic, readonly) NSArray *typeList;

+ (void)setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync;

+ (void)setObject:(id)value forKey:(NSString *)key;

+ (id)objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

+ (id)objectForKey:(NSString *)key;

+ (void)synchronizeAndCloudSync:(BOOL)sync;

+ (void)synchronize;

+ (void)setArcObject:(id)value forKey:(NSString *)key;

+ (id)arcObjectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
