//
//  UIView+AutoLayout.h
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

@interface UIView (AutoLayout)

#pragma mark 在父视图中居中

/**
 * 在水平和垂直方向上居中。
 */
- (void)autoLayoutCenter;

/**
 * 在水平方向上居中。
 */
- (void)autoLayoutCenterX;

/**
 * 在垂直方向上居中。
 */
- (void)autoLayoutCenterY;

#pragma mark 连接到父视图

/**
 * 距离父视图的四个边保持 @p margin 距离。
 */
- (void)autoLayoutConnectAll:(CGFloat)margin;

/**
 * 距离父视图左右两边均保持 @p margin 距离。
 */
- (void)autoLayoutConnectX:(CGFloat)margin;

/**
 * 距离父视图上下两边均保持 @p margin 距离。
 */
- (void)autoLayoutConnectY:(CGFloat)margin;

/**
 * 距离父视图左侧 (Leading) 保持 @p margin 距离。
 */
- (void)autoLayoutConnectLeft:(CGFloat)margin;

/**
 * 距离父视图右侧 (Trailing) 保持 @p margin 距离。
 */
- (void)autoLayoutConnectRight:(CGFloat)margin;

/**
 * 距离父视图上边保持 @p margin 距离。
 */
- (void)autoLayoutConnectTop:(CGFloat)margin;

/**
 * 距离父视图下边保持 @p margin 距离。
 */
- (void)autoLayoutConnectBottom:(CGFloat)margin;

/**
 * 距离父视图每个边都设置一定的距离，并且用 @p UIEdgeInsets 来表达这些距离。
 */
- (void)autoLayoutConnect:(UIEdgeInsets)insets;

#pragma mark 设置尺寸

/**
 * 设置视图的自动布局宽度。
 */
- (void)autoLayoutWidth:(CGFloat)width;

/**
 * 设置视图的自动布局高度。
 */
- (void)autoLayoutHeight:(CGFloat)height;

/**
 * 设置视图的自动布局宽度和高度。
 */
- (void)autoLayoutSize:(CGSize)size;

#pragma mark 布局表达式

/**
 * 为当前视图添加由 @p object 所表达的一个或一组自动布局表达式。
 *
 * @param object 只能提供 @p NSString 和 @p NSArray 类型的数据。
 */
- (void)autoLayoutVF:(id)object views:(NSDictionary *)views metrics:(NSDictionary *)metrics;

/**
 * 获取由 object 所表达的所有布局约束 (NSArray).
 *
 * @param object 只能提供 @p NSString 和 @p NSArray 类型的数据。
 */
- (NSArray *)autoLayoutConstraintsWithVF:(id)object views:(NSDictionary *)views metrics:(NSDictionary *)metrics;

@end
