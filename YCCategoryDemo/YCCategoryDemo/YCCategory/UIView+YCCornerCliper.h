//
//  UIView+YCCornerCliper.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YCCornerCliper)

- (void)yc_clipCorners:(UIRectCorner)corners radius:(CGFloat)radius;

- (void)yc_clipCorners:(UIRectCorner)corners radius:(CGFloat)radius border:(CGFloat)width color:(nullable UIColor *)color;

@end

NS_ASSUME_NONNULL_END
