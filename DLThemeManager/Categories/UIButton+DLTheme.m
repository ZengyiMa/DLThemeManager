//
//  UIButton+DLTheme.m
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import "UIButton+DLTheme.h"

@implementation UIButton (DLTheme)





- (void)dl_setTitleColorThemeKey:(NSString *)key forState:(UIControlState)state
{
    [self dl_setKey:[NSString stringWithFormat:@"buttonTitleColor_%d", (int)state] colorKey:key selector:@selector(dl_changeTitleColor:association:) withUserInfo:@{@"state":@(state)}];
}

- (void)dl_changeTitleColor:(UIColor *)newColor association:(DLThemeColorAssociation *)association
{
    NSNumber *state = association.userInfo[@"state"];
    [self setTitleColor:newColor forState:state.integerValue];
}

@end
