//
//  UIView+DLTheme.m
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import "UIView+DLTheme.h"

@implementation UIView (DLTheme)

@dynamic backgroundThemeKey;

- (void)setBackgroundThemeKey:(NSString *)backgroundThemeKey
{
    self.backgroundColor = [UIColor dl_colorWithKey:backgroundThemeKey];
    [self dl_setKey:@"backgroundColor" colorKey:backgroundThemeKey selector:@selector(dl_changeBackgroundColor:) withUserInfo:nil];
}

- (void)dl_changeBackgroundColor:(UIColor *)color
{
    self.backgroundColor = color;
}




@end
