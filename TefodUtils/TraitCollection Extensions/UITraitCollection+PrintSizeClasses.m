//
//  UITraitCollection+PrintSizeClasses.m
//  kxqd3
//
//  Created by Eric Chai on 15/8/2.
//  Copyright (c) 2015年 Tefod. All rights reserved.
//

#import "UITraitCollection+PrintSizeClasses.h"

@implementation UITraitCollection (PrintSizeClasses)

- (NSString *)sizeClassesString {
	NSString *const REGULAR = @"+";
	NSString *const COMPACT = @"-";
	NSString *const UNSPECIFIED = @"*";
	
	NSString *horizontal, *verticle;
	
	switch (self.horizontalSizeClass) {
		case UIUserInterfaceSizeClassRegular:
			horizontal = REGULAR;
			break;
		case UIUserInterfaceSizeClassCompact:
			horizontal = COMPACT;
			break;
		default:
			horizontal = UNSPECIFIED;
			break;
	}
	
	switch (self.verticalSizeClass) {
		case UIUserInterfaceSizeClassRegular:
			verticle = REGULAR;
			break;
		case UIUserInterfaceSizeClassCompact:
			verticle = COMPACT;
			break;
		default:
			verticle = UNSPECIFIED;
			break;
	}
	
	return [NSString stringWithFormat:@"h%@ v%@", horizontal, verticle];
}

- (void)printSizeClasses {
	printf("%s\n", self.sizeClassesString.UTF8String);
}

@end
