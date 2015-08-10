//
//  UIColor+Generator.h
//  kxqd3
//
//  Created by Eric Chai on 15/8/10.
//  Copyright (c) 2015年 Tefod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Generator)

/**
 * 以当前颜色的 RGB 为基准，生成新的颜色并使用给定的 alpha hex 值 (0~255) 作为新颜色的 alpha 值。
 */
- (UIColor *)colorWithAlphaComponentHex:(NSInteger)hex;

/**
 * 调整当前颜色的亮度，并返回新颜色。调整值 @p lightness 为原颜色亮度的比例，可正可负。
 */
- (UIColor *)scaledWithLightness:(CGFloat)lightness;

@end
