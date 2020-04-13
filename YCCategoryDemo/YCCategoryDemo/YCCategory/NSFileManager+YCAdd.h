//
//  NSFileManager+YCAdd.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (YCAdd)

@property (class, readonly, nullable) NSURL *documentsURL;
@property (class, readonly, nullable) NSString *documentsPath;
@property (class, readonly, nullable) NSURL *libraryURL;
@property (class, readonly, nullable) NSString *libraryPath;
@property (class, readonly, nullable) NSURL *cachesURL;
@property (class, readonly, nullable) NSString *cachesPath;
@property (class, readonly, assign) CGFloat availableDiskSpace;

+ (BOOL)fileExistAtPath:(NSString *)path;
+ (BOOL)createDirectoryAtPath:(NSString *)path;

+ (NSURL *)fileURLForDirectory:(NSSearchPathDirectory)directory;
+ (NSString *)filePathForDirectory:(NSSearchPathDirectory)directory;
+ (BOOL)addSkipBackupAttributeToFile:(NSString *)path;

- (unsigned long long)sizeOfFolder:(NSString *)folderPath;
- (NSString *)appFileSize;

@end

NS_ASSUME_NONNULL_END
