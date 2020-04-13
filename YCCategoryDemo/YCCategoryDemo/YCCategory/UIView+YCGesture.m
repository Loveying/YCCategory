//
//  UIView+YCGesture.m
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import "UIView+YCGesture.h"
#import <objc/runtime.h>

static const char yc_kActionHandlerTapBlockKey;
static const char yc_kActionHandlerTapGestureKey;

static const char yc_kActionHandlerDoubleTapBlockKey;
static const char yc_kActionHandlerDoubleTapGestureKey;

static const char yc_kActionHandlerLongPressBlockKey;
static const char yc_kActionHandlerLongPressGestureKey;

@implementation UIView (YCGesture)

- (void)yc_addTapActionWithBlock:(YCGestureActionBlock)block {
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &yc_kActionHandlerTapBlockKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yc_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &yc_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &yc_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}


- (void)yc_handleActionForTapGesture:(UITapGestureRecognizer*)gesture {
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        YCGestureActionBlock block = objc_getAssociatedObject(self, &yc_kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
    
}

- (void)yc_addDoubleTapActionWithBlock:(YCGestureActionBlock)block {
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &yc_kActionHandlerDoubleTapBlockKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer  alloc] initWithTarget:self action:@selector(yc_handleActionForDoubleTapGesture:)];
        [gesture setNumberOfTapsRequired:2];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &yc_kActionHandlerDoubleTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &yc_kActionHandlerDoubleTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)yc_handleActionForDoubleTapGesture:(UITapGestureRecognizer*)gesture {
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        YCGestureActionBlock block = objc_getAssociatedObject(self, &yc_kActionHandlerDoubleTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
    
}

- (void)yc_addLongPressActionWithBlock:(YCGestureActionBlock)block {
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &yc_kActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(yc_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &yc_kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &yc_kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}


- (void)yc_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        YCGestureActionBlock block = objc_getAssociatedObject(self, &yc_kActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}


@end
