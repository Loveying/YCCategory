//
//  NSData+YCEncrypt.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (YCEncrypt)

- (NSData *)md5Data;
- (nullable NSString *)md5String;

- (NSData *)sha1Data;
- (nullable NSString *)sha1String;

- (nullable NSString *)base64EncodedString;
+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

+ (nullable NSData *)aes256EncryptWithKey:(NSString *)key encryptText:(nullable NSData *)text;
+ (nullable NSData *)aes256DecryptWithkey:(NSString *)key dencryptText:(nullable NSData *)text;

@end

NS_ASSUME_NONNULL_END
