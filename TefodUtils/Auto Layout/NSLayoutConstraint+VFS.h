//
//  NSLayoutConstraint+VFS.h
//  kxqd3
//
//  Created by Eric Chai on 8/1/15.
//  Copyright (c) 2015 Tefod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (VFS)

/**
 * 获取由 object 所表达的所有布局约束 (NSArray).
 *
 * @param object 只能提供 @p NSString 和 @p NSArray 类型的数据。
 */
+ (NSArray *)constraintsWithVFObject:(id)object views:(NSDictionary *)views metrics:(NSDictionary *)metrics;

@end
