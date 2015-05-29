//
//  UIColor+RGB.m
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

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (instancetype)colorWithRgbHex:(NSInteger)hex {
	CGFloat red = (CGFloat)((hex >> 16) & 0xff) / 255.0;
	CGFloat green = (CGFloat)((hex >> 8) & 0xff) / 255.0;
	CGFloat blue = (CGFloat)(hex & 0xff) / 255.0;
	return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:1];
}

+ (instancetype)colorWithRgbaHex:(NSInteger)hex {
	CGFloat red = (CGFloat)((hex >> 24) & 0xff) / 255.0;
	CGFloat green = (CGFloat)((hex >> 16) & 0xff) / 255.0;
	CGFloat blue = (CGFloat)((hex >> 8) & 0xff) / 255.0;
	CGFloat alpha = (CGFloat)(hex & 0xff) / 255.0;
	return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
}

- (UIColor *)colorWithAlphaComponentHex:(NSInteger)hex {
	return [self colorWithAlphaComponent:hex / 255.0];
}

@end
