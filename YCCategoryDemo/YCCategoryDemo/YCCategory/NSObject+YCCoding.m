//
//  NSObject+YCCoding.m
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import "NSObject+YCCoding.h"
#import <objc/message.h>

@implementation NSObject (YCCoding)

- (void)yc_encode:(NSCoder *)aCoder {
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [[NSString alloc]initWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
  
}

- (void)yc_decode:(NSCoder *)aDecoder {
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [[NSString alloc]initWithUTF8String:name];
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
   
}

@end
