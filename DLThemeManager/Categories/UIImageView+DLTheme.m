//
//  UIImageView+DLTheme.m
//  DLThemeManager
//
//  Created by famulei on 29/11/2016.
//
//

#import "UIImageView+DLTheme.h"

@implementation UIImageView (DLTheme)


- (void)dl_setImageKey:(NSString *)key
{
    self.image = [[DLThemeManager sharedManager] imageForKey:key];
    [self dl_setKey:@"image" imageKey:key selector:@selector(dl_setThemeImage:) withUserInfo:nil];
}

- (void)dl_setThemeImage:(UIImage *)image
{
    self.image = image;
}



@end
