//
//  UIView+AutoLayout.m
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

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)

#pragma mark 在父视图中居中

- (void)autoLayoutCenter {
	[self autoLayoutCenterX];
	[self autoLayoutCenterY];
}

- (void)autoLayoutCenterX {
	[self.superview addConstraint:[NSLayoutConstraint
								   constraintWithItem:self attribute:NSLayoutAttributeCenterX
								   relatedBy:NSLayoutRelationEqual
								   toItem:self.superview attribute:NSLayoutAttributeCenterX
								   multiplier:1 constant:0]];
}

- (void)autoLayoutCenterY {
	[self.superview addConstraint:[NSLayoutConstraint
								   constraintWithItem:self attribute:NSLayoutAttributeCenterY
								   relatedBy:NSLayoutRelationEqual
								   toItem:self.superview attribute:NSLayoutAttributeCenterY
								   multiplier:1 constant:0]];
}

#pragma mark 连接到父视图

- (void)autoLayoutConnectAll:(CGFloat)margin {
	UIEdgeInsets insets = UIEdgeInsetsMake(margin, margin, margin, margin);
	[self autoLayoutConnect:insets];
}

- (void)autoLayoutConnectX:(CGFloat)margin {
	[self autoLayoutConnectLeft:margin];
	[self autoLayoutConnectRight:margin];
}

- (void)autoLayoutConnectY:(CGFloat)margin {
	[self autoLayoutConnectTop:margin];
	[self autoLayoutConnectBottom:margin];
}

- (void)autoLayoutConnectLeft:(CGFloat)margin {
	[self.superview addConstraint:[NSLayoutConstraint
								   constraintWithItem:self attribute:NSLayoutAttributeLeading
								   relatedBy:NSLayoutRelationEqual
								   toItem:self.superview attribute:NSLayoutAttributeLeading
								   multiplier:1 constant:margin]];
}

- (void)autoLayoutConnectRight:(CGFloat)margin {
	[self.superview addConstraint:[NSLayoutConstraint
								   constraintWithItem:self attribute:NSLayoutAttributeTrailing
								   relatedBy:NSLayoutRelationEqual
								   toItem:self.superview attribute:NSLayoutAttributeTrailing
								   multiplier:1 constant:-margin]];
}

- (void)autoLayoutConnectTop:(CGFloat)margin {
	[self.superview addConstraint:[NSLayoutConstraint
								   constraintWithItem:self attribute:NSLayoutAttributeTop
								   relatedBy:NSLayoutRelationEqual
								   toItem:self.superview attribute:NSLayoutAttributeTop
								   multiplier:1 constant:margin]];
}

- (void)autoLayoutConnectBottom:(CGFloat)margin {
	[self.superview addConstraint:[NSLayoutConstraint
								   constraintWithItem:self attribute:NSLayoutAttributeBottom
								   relatedBy:NSLayoutRelationEqual
								   toItem:self.superview attribute:NSLayoutAttributeBottom
								   multiplier:1 constant:-margin]];
}

- (void)autoLayoutConnect:(UIEdgeInsets)insets {
	[self autoLayoutConnectLeft:insets.left];
	[self autoLayoutConnectRight:insets.right];
	[self autoLayoutConnectTop:insets.top];
	[self autoLayoutConnectBottom:insets.bottom];
}

#pragma mark 设置尺寸

- (void)autoLayoutWidth:(CGFloat)width {
	[self addConstraint:[NSLayoutConstraint
						 constraintWithItem:self attribute:NSLayoutAttributeWidth
						 relatedBy:NSLayoutRelationEqual
						 toItem:nil attribute:NSLayoutAttributeNotAnAttribute
						 multiplier:0 constant:width]];
}

- (void)autoLayoutHeight:(CGFloat)height {
	[self addConstraint:[NSLayoutConstraint
						 constraintWithItem:self attribute:NSLayoutAttributeHeight
						 relatedBy:NSLayoutRelationEqual
						 toItem:nil attribute:NSLayoutAttributeNotAnAttribute
						 multiplier:0 constant:height]];
}

- (void)autoLayoutSize:(CGSize)size {
	[self autoLayoutWidth:size.width];
	[self autoLayoutHeight:size.height];
}

#pragma mark 布局表达式

- (void)autoLayoutVF:(id)object views:(NSDictionary *)views metrics:(NSDictionary *)metrics {
	if (!object)
		return;
	
	if ([object isKindOfClass:[NSString class]]) {
		// 如果是一个字符串，直接把它当做一个布局表达式
		[self addConstraints:[NSLayoutConstraint
							  constraintsWithVisualFormat:object options:0
							  metrics:metrics views:views]];
		
	} else if ([object isKindOfClass:[NSArray class]]) {
		// 如果是一个数组，把它当做一系列布局表达式的集合
		for (NSString *vf in object)
			[self addConstraints:[NSLayoutConstraint
								  constraintsWithVisualFormat:vf
								  options:0 metrics:metrics views:views]];
	} else {
		// 非法的数据类型
		NSAssert(NO, @"提供的 object 必须是 NSString 或 NSArray 类型");
	}
}

- (NSArray *)autoLayoutConstraintsWithVF:(id)object views:(NSDictionary *)views metrics:(NSDictionary *)metrics {
	NSMutableArray *constraints = [NSMutableArray array];
	
	if (!object)
		return constraints;
	
	if ([object isKindOfClass:[NSString class]]) {
		// 如果是一个字符串，直接把它当做一个布局表达式
		[constraints addObjectsFromArray:[NSLayoutConstraint
										  constraintsWithVisualFormat:object options:0
										  metrics:metrics views:views]];
		
	} else if ([object isKindOfClass:[NSArray class]]) {
		// 如果是一个数组，把它当做一系列布局表达式的集合
		for (NSString *vf in object) {
			[constraints addObjectsFromArray:[NSLayoutConstraint
											  constraintsWithVisualFormat:vf options:0
											  metrics:metrics views:views]];
		}
		
	} else {
		// 非法的数据类型
		return constraints;
	}
	
	return constraints;
}

@end
