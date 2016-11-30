//
//  UIColor+DLTheme.m
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import "UIColor+DLTheme.h"
#import "DLThemeManager.h"


// from yy
static inline NSUInteger dl_hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}

static BOOL dl_hexStrToRGBA(NSString *str,
                         CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    str = [[str stringByTrimmingCharactersInSet:set] uppercaseString];
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = dl_hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = dl_hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = dl_hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = dl_hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = dl_hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = dl_hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = dl_hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = dl_hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}






@implementation UIColor (DLTheme)


+ (UIColor *)dl_colorWithKey:(NSString *)key
{
    return [[DLThemeManager sharedManager] colorForKey:key];
}

+ (UIColor *)dl_colorWithHexString:(NSString *)hexStr
{
    CGFloat r, g, b, a;
    if (dl_hexStrToRGBA(hexStr, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    return nil;
}

@end
