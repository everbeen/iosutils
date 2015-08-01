//
//  NSLayoutConstraint+VFS.m
//  kxqd3
//
//  Created by Eric Chai on 8/1/15.
//  Copyright (c) 2015 Tefod. All rights reserved.
//

#import "NSLayoutConstraint+VFS.h"

@implementation NSLayoutConstraint (VFS)

+ (NSArray *)constraintsWithVFObject:(id)object views:(NSDictionary *)views metrics:(NSDictionary *)metrics {
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
