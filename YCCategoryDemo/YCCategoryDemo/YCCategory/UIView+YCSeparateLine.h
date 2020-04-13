//
//  UIView+YCSeparateLine.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**分割线的位置*/
typedef NS_OPTIONS(NSUInteger, YCSeparateLinePosition) {
    YCSeparateLinePositionTop       = 1 << 0, //top line
    YCSeparateLinePositionBottom    = 1 << 1, //bottom line
    YCSeparateLinePositionLeft      = 1 << 2, //left line
    YCSeparateLinePositionRight     = 1 << 3, //right line
};

@interface UIView (YCSeparateLine)

- (void)yc_setSeparateLineMode:(YCSeparateLinePosition)linePosition lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth;

@end

NS_ASSUME_NONNULL_END
