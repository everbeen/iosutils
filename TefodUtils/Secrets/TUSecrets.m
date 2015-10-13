//
//  TUSecrets.m
//  rosa
//
//  Created by Eric Chai on 15/10/13.
//  Copyright © 2015年 Tefod. All rights reserved.
//

#import "TUSecrets.h"

@implementation TUSecrets

+ (NSData *)dataForKey:(NSString *)key {
	NSDictionary *query = @{(__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
							(__bridge id)kSecAttrService: key,
							(__bridge id)kSecReturnData: (id)kCFBooleanTrue};
	CFTypeRef result = nil;
	SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
	if (!result)
		return nil;
	return (__bridge NSData *)result;
}

+ (NSString *)stringForKey:(NSString *)key {
	NSData *data = [self dataForKey:key];
	if (!data)
		return nil;
	return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSInteger)intForKey:(NSString *)key {
	NSData *data = [self dataForKey:key];
	if (data.length != 8)
		return NSNotFound;
	int64_t *value = (int64_t *)data.bytes;
	return (NSInteger)*value;
}

+ (void)setData:(NSData *)data forKey:(NSString *)key {
	NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
	[attrs setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
	[attrs setObject:key forKey:(__bridge id)kSecAttrService];
	
	SecItemDelete((__bridge CFDictionaryRef)attrs);
	
	if (data) {
		[attrs setObject:data forKey:(__bridge id)kSecValueData];
		SecItemAdd((__bridge CFDictionaryRef)attrs, NULL);
	}
}

+ (void)setString:(NSString *)string forKey:(NSString *)key {
	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
	[self setData:data forKey:key];
}

+ (void)setInt:(NSInteger)number forKey:(NSString *)key {
	int64_t value = (int64_t)number;
	NSData *data = [NSData dataWithBytesNoCopy:&value length:8 freeWhenDone:NO];
	[self setData:data forKey:key];
}

+ (void)removeItemForKey:(NSString *)key {
	NSDictionary *query = @{(__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
							(__bridge id)kSecAttrService: key};
	SecItemDelete((__bridge CFDictionaryRef)query);
}

@end
