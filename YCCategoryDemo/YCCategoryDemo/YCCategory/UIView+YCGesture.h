//
//  UIView+YCGesture.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^YCGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (YCGesture)

/**
 添加tap手势
 
 @param block 回调
 */
- (void)yc_addTapActionWithBlock:(YCGestureActionBlock)block;


/**
 添加double tap手势

 @param block 回调
 */
- (void)yc_addDoubleTapActionWithBlock:(YCGestureActionBlock)block;

/**
 添加长按手势
 
 @param block 回调
 */
- (void)yc_addLongPressActionWithBlock:(YCGestureActionBlock)block;

@end

NS_ASSUME_NONNULL_END
