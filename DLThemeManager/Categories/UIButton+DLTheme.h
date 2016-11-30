//
//  UIButton+DLTheme.h
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import <UIKit/UIKit.h>
#import "NSObject+DLTheme.h"


@interface UIButton (DLTheme)

- (void)dl_setTitleColorThemeKey:(NSString *)key forState:(UIControlState)state;
@end
