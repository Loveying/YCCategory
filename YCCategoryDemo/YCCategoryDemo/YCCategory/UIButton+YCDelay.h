//
//  UIButton+YCDelay.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YCDelay)

/**
 *  设置点击时间间隔
 */
@property (nonatomic, assign) NSTimeInterval yc_eventInterval;

/**
 *  用于设置单个按钮不需要被hook
 */
@property (nonatomic,assign) BOOL yc_ignoreEvent;

@end

NS_ASSUME_NONNULL_END
