//
//  UITraitCollection+PrintSizeClasses.h
//  kxqd3
//
//  Created by Eric Chai on 15/8/2.
//  Copyright (c) 2015年 Tefod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITraitCollection (PrintSizeClasses)

/**
 * 获取描述 size classes 的字符串。
 */
@property (strong, nonatomic, readonly) NSString *sizeClassesString;

/**
 * 输出 horizontal 和 verticle 的 size class 值。
 */
- (void)printSizeClasses;

@end
