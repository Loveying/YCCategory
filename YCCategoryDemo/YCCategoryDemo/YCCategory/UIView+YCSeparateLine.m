//
//  UIView+YCSeparateLine.m
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import "UIView+YCSeparateLine.h"

@implementation UIView (YCSeparateLine)

- (void)yc_setSeparateLineMode:(YCSeparateLinePosition)linePosition lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth {
    
    CGSize viewSize = self.frame.size;
    CALayer *linelayer = [CALayer layer];
    linelayer.backgroundColor = lineColor.CGColor;
    if (linePosition & YCSeparateLinePositionTop) linelayer.frame = CGRectMake(0, 0, viewSize.width, lineWidth);
    if (linePosition & YCSeparateLinePositionBottom) linelayer.frame = CGRectMake(0, viewSize.height - lineWidth, viewSize.width, lineWidth);
    if (linePosition & YCSeparateLinePositionLeft) linelayer.frame = CGRectMake(0, 0, lineWidth, viewSize.height);
    if (linePosition & YCSeparateLinePositionRight) linelayer.frame = CGRectMake(viewSize.width - lineWidth, 0, lineWidth, viewSize.height);
    [self.layer addSublayer:linelayer];
    
}


@end
