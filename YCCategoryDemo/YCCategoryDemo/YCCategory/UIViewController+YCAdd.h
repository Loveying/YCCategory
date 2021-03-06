//
//  UIViewController+YCAdd.h
//  YCCategoryDemo
//
//  Created by Codyy.YY on 2020/4/13.
//  Copyright © 2020 Codyy.YY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YCAdd)

+ (UIViewController *)yc_rootViewController;

+ (UIViewController *)yc_findVisibleViewController;

@end

NS_ASSUME_NONNULL_END
