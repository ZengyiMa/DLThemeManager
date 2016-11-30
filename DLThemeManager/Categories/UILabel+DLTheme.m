//
//  UILabel+DLTheme.m
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import "UILabel+DLTheme.h"

@implementation UILabel (DLTheme)


@dynamic textColorThemeKey;

- (void)setTextColorThemeKey:(NSString *)textColorThemeKey
{
    self.textColor = [UIColor dl_colorWithKey:textColorThemeKey];
    [self dl_setKey:@"textColor" colorKey:textColorThemeKey selector:@selector(dl_changeTextColor:) withUserInfo:nil];
}

- (void)dl_changeTextColor:(UIColor *)color
{
    self.textColor = color;
}

@end
