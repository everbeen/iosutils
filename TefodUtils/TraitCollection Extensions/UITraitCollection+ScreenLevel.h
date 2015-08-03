//
//  UITraitCollection+ScreenLevel.h
//  kxqd3
//
//  Created by Eric Chai on 15/8/3.
//  Copyright (c) 2015年 Tefod. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 屏幕尺寸级别 (size level)。
 *
 * 对于 iPad，屏幕尺寸级别始终为 @p TFUserInterfaceSizeLevelLarge;
 * 而对于 iPhone，具有两种屏幕尺寸级别:
 *
 * - iPhone 4S 的屏幕尺寸级别为 @p TFUserInterfaceSizeLevelSamll;
 * - 除 iPhone 4S 外的其他 iPhone 则为 @p TFUserInterfaceSizeLevelNormal.
 */
typedef NS_ENUM(NSInteger, TFUserInterfaceSizeLevel) {
	TFUserInterfaceSizeLevelSamll  = 5,
	TFUserInterfaceSizeLevelNormal = 10,
	TFUserInterfaceSizeLevelLarge  = 25,
};

@interface UITraitCollection (ScreenLevel)

/**
 * 获取当前设备的屏幕的尺寸级别 (size level). 只读。
 */
@property (assign, nonatomic, readonly) TFUserInterfaceSizeLevel sizeLevel;

@end
