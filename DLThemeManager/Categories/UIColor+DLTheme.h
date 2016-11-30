//
//  UIColor+DLTheme.h
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import <UIKit/UIKit.h>


// From UIColor+YYAdd
#ifndef DLColorHex
#define DLColorHex(_hex_)   [UIColor dl_colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

@interface UIColor (DLTheme)


+ (UIColor *)dl_colorWithKey:(NSString *)key;

+ (UIColor *)dl_colorWithHexString:(NSString *)hexStr;

@end
