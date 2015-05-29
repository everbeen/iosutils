//
//  UIImage+Creation.h
//  iosutils - https://github.com/everbeen/iosutils
//
//  Copyright (c) 2015 Eric
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import <UIKit/UIKit.h>

@interface UIImage (Creation)

/**
 * 返回给定名字的图像的 UIImageRenderingModeAlwaysTemplate 渲染模式副本。
 */
+ (instancetype)templateImageNamed:(NSString *)name;

/**
 * 使用纯色 @p color 绘制一副具有尺寸 @p size 的图像。
 *
 * @warning size 并非指像素尺寸，而是指当前设备的点尺寸。
 */
+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * 使用纯色 @p color 绘制一副 1⨉1 尺寸的图像。
 */
+ (instancetype)imageWithColor:(UIColor *)color;

@end
