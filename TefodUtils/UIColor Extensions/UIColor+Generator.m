//
//  UIColor+Generator.m
//  kxqd3
//
//  Created by Eric Chai on 15/8/10.
//  Copyright (c) 2015年 Tefod. All rights reserved.
//

#import "UIColor+Generator.h"

@implementation UIColor (Generator)

- (UIColor *)colorWithAlphaComponentHex:(NSInteger)hex {
	return [self colorWithAlphaComponent:hex / 255.0];
}

- (UIColor *)scaledWithLightness:(CGFloat)lightness {
	CGFloat h, s, b, a;
	if (![self getHue:&h saturation:&s brightness:&b alpha:&a])
		return nil;
	
	b += b * lightness;
	if (b < 0) b = 0;
	else if (b > 1) b = 1;
	
	return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
}

@end
