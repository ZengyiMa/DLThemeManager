//
//  UITextField+DLTheme.m
//  Niupu_SNS
//
//  Created by famulei on 09/12/2016.
//  Copyright © 2016 WE. All rights reserved.
//

#import "UITextField+DLTheme.h"
#import "NSObject+DLTheme.h"

@implementation UITextField (DLTheme)

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
