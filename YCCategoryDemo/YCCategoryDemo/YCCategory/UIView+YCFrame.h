//
//  UIView+YCFrame.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YCFrame)

@property (nonatomic) CGFloat yc_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat yc_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat yc_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat yc_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat yc_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat yc_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat yc_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat yc_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint yc_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  yc_size;

@end

NS_ASSUME_NONNULL_END
