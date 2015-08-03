//
//  UITraitCollection+ScreenLevel.m
//  kxqd3
//
//  Created by Eric Chai on 15/8/3.
//  Copyright (c) 2015年 Tefod. All rights reserved.
//

#import "UITraitCollection+ScreenLevel.h"

@implementation UITraitCollection (ScreenLevel)

- (TFUserInterfaceSizeLevel)sizeLevel {
	static TFUserInterfaceSizeLevel sharedSizeLevel;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
			sharedSizeLevel = TFUserInterfaceSizeLevelLarge;
		} else {
			// 确定出设备在 portrait 方向下的高度
			CGSize screenSize = [[UIScreen mainScreen] bounds].size;
			CGFloat portraitHeight = screenSize.height;
			if (screenSize.width > portraitHeight)
				portraitHeight = screenSize.width;
			
			if (portraitHeight > 500)
				sharedSizeLevel = TFUserInterfaceSizeLevelNormal;
			else
				sharedSizeLevel = TFUserInterfaceSizeLevelSamll;
		}
	});
	return sharedSizeLevel;
}

@end
