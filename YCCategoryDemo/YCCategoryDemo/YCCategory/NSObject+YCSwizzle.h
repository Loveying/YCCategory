//
//  NSObject+YCSwizzle.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YCSwizzle)

+ (BOOL)yc_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel error:(NSError**)error;

+ (BOOL)yc_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END
