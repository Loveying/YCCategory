//
//  UIViewController+YCAdd.m
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import "UIViewController+YCAdd.h"

@implementation UIViewController (YCAdd)

+ (UIViewController *)yc_rootViewController {
    return [UIApplication sharedApplication].delegate.window.rootViewController;
}

+ (UIViewController *)yc_findVisibleViewController {
    UIViewController* currentViewController = [self yc_rootViewController];

    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
        } else {
            if ([currentViewController isKindOfClass:[UINavigationController class]]) {
                currentViewController = ((UINavigationController *)currentViewController).visibleViewController;
            } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
                currentViewController = ((UITabBarController* )currentViewController).selectedViewController;
            } else {
                break;
            }
        }
    }
    
    return currentViewController;
}

@end
