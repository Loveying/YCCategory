//
//  NSString+YCEncrypt.m
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import "NSString+YCEncrypt.h"
#import "NSData+YCEncrypt.h"

@implementation NSString (YCEncrypt)

//md5加密
- (NSString *)md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5String];
}

//sha1加密
- (NSString *)sha1String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha1String];
}

//base64加密
- (NSString *)base64EncodedString {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
}

//base64解密
+ (NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString {
    NSData *data = [NSData dataWithBase64EncodedString:base64EncodedString];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//aes256加密
- (NSString *)aes256String {
    
    NSString *aes256Key = @"123456";
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    //对数据进行加密
    NSData *result = [NSData aes256EncryptWithKey:aes256Key encryptText:data];
    //转换为2进制字符串
    if (result && result.length > 0) {
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        for(int i = 0; i < result.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return output;
    }
    return nil;
}

//aes256解密
+ (NSString *)stringWithAes256EncodedString:(NSString *)aes256EncodedString {
    NSString *aes256Key = @"123456";
    //转换为2进制Data
    NSMutableData *data = [NSMutableData dataWithCapacity:aes256EncodedString.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [aes256EncodedString length] / 2; i++) {
        byte_chars[0] = [aes256EncodedString characterAtIndex:i*2];
        byte_chars[1] = [aes256EncodedString characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    //对数据进行解密
    NSData *result = [NSData aes256DecryptWithkey:aes256Key dencryptText:data];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}

@end
