//
//  NSObject+YCCoding.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <Foundation/Foundation.h>

#define YCCodingImplementation \
-(void)encodeWithCoder:(NSCoder *)aCoder\
{\
[self yc_encode:aCoder];\
}\
-(instancetype)initWithCoder:(NSCoder *)aDecoder\
{\
if (self = [super init]) {\
[self yc_decode:aDecoder];\
}return self; \
}

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YCCoding)

- (void)yc_encode:(NSCoder *)aCoder;

- (void)yc_decode:(NSCoder *)aDecoder;

@end

NS_ASSUME_NONNULL_END
