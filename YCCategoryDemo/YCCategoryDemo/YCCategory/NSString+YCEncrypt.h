//
//  NSString+YCEncrypt.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YCEncrypt)

//md5加密
- (nullable NSString *)md5String;

//sha1加密
- (nullable NSString *)sha1String;

//base64加密
- (nullable NSString *)base64EncodedString;

//base64解密
+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;

//aes256加密
- (nullable NSString *)aes256String;

//aes256解密
+ (nullable NSString *)stringWithAes256EncodedString:(NSString *)aes256EncodedString;

@end

NS_ASSUME_NONNULL_END
