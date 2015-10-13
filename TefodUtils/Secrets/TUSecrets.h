//
//  TUSecrets.h
//  rosa
//
//  Created by Eric Chai on 15/10/13.
//  Copyright © 2015年 Tefod. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 对 Keychain 操作的简单封装。
 *
 * TUSecrets 会将数据写入到 @p kSecClassGenericPassword 的 class 中。
 */
@interface TUSecrets : NSObject

/**
 * 从 Keychain 中获取 @p key 对应的数据项。
 *
 * 若 Keychain 中没有找到 @p key 对应的数据项，将返回从 @p nil.
 */
+ (NSData *)dataForKey:(NSString *)key;

/**
 * 从 Keychain 中获取 @p key 对应的数据项，并将其转换成一个 UTF-8 编码的字符串。
 *
 * 若 Keychain 中没有找到 @p key 对应的数据项，或无法将这一数据项转换成一个
 * UTF-8 字符串，方法将返回 @p nil.
 */
+ (NSString *)stringForKey:(NSString *)key;

/**
 * 获取之前存入的一个整数。
 *
 * 如果得到的数值并不是一个合理的数字，或根本没有获取到任何数据，此方法将返回 @p NSNotFound.
 */
+ (NSInteger)intForKey:(NSString *)key;


/**
 * 向 Keychain 中写入一个数据项。
 *
 * 如果 @p key 对应的数据项已经存在，方法将先移除这一数据项，再为其设置新值；
 * 如果 @p data 为 @p nil，则方法将会移除这一数据项。
 */
+ (void)setData:(NSData *)data forKey:(NSString *)key;

/**
 * 向 Keychain 中写入一个字符串数据项。
 *
 * 如果 @p key 对应的数据项已经存在，方法将先移除这一数据项，再为其设置新的字符串；
 * 如果 @p string 为 @p nil，则方法将会移除这一数据项。
 */
+ (void)setString:(NSString *)string forKey:(NSString *)key;

/**
 * 向 keychain 中写入一个整数。
 */
+ (void)setInt:(NSInteger)number forKey:(NSString *)key;

/**
 * 从 Keychain 中移除一个数据项。
 */
+ (void)removeItemForKey:(NSString *)key;

@end
