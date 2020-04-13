//
//  UIButton+YCDelay.m
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import "UIButton+YCDelay.h"
#import <objc/runtime.h>

static const NSTimeInterval YCDefaultInterval = 0.5;

@implementation UIButton (YCDelay)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selA = @selector(sendAction:to:forEvent:);
        SEL selB = @selector(yc_sendAction:to:forEvent:);
        Method methodA =  class_getInstanceMethod(self,selA);
        Method methodB = class_getInstanceMethod(self, selB);
        //将 methodB的实现 添加到系统方法中 也就是说 将 methodA方法指针添加成 方法methodB的  返回值表示是否添加成功
        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
        //添加成功了 说明 本类中不存在methodB 所以此时必须将方法b的实现指针换成方法A的，否则 b方法将没有实现。
        if (isAdd) {
            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
        }else{
            //添加失败了 说明本类中 有methodB的实现，此时只需要将 methodA和methodB的IMP互换一下即可。
            method_exchangeImplementations(methodA, methodB);
        }
    });
    
}

#pragma mark - Action functions

- (void)yc_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if ([NSStringFromClass(self.class)isEqualToString:@"UIButton"]) {
        self.yc_eventInterval = self.yc_eventInterval == 0 ? YCDefaultInterval : self.yc_eventInterval;
        if (self.yc_ignoreEvent) return;
        [self performSelector:@selector(resetButtonState) withObject:nil afterDelay:self.yc_eventInterval];
    }
    self.yc_ignoreEvent = YES;
    [self yc_sendAction:action to:target forEvent:event];
    
}

#pragma mark - 重置按钮的状态
- (void)resetButtonState {
    [self setYc_ignoreEvent:NO];
}

#pragma mark - Setter & Getter functions

- (NSTimeInterval)yc_eventInterval {
    
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setYc_eventInterval:(NSTimeInterval)yc_eventInterval {
    
    objc_setAssociatedObject(self, @selector(yc_eventInterval), @(yc_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)yc_ignoreEvent {
    
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setYc_ignoreEvent:(BOOL)yc_ignoreEvent {
    
    objc_setAssociatedObject(self, @selector(yc_ignoreEvent), @(yc_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
