//
//  NSObject+DLTheme.m
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import "NSObject+DLTheme.h"
#import <objc/runtime.h>



@implementation NSObject (DLTheme)

- (void)dl_setKey:(NSString *)objectKey colorKey:(NSString *)colorKey selector:(SEL)selector withUserInfo:(NSDictionary *)userInfo
{
    [[self dl_Association]setKey:objectKey colorKey:colorKey selector:selector withUserInfo:userInfo];
}
- (void)dl_setKey:(NSString *)objectKey colorKey:(NSString *)colorKey block:(DLThemeBlock)block withUserInfo:(NSDictionary *)userInfo
{
    [[self dl_Association]setKey:objectKey colorKey:colorKey block:block withUserInfo:userInfo];
}

- (void)dl_setKey:(NSString *)objectKey imageKey:(NSString *)colorKey selector:(SEL)selector withUserInfo:(NSDictionary *)userInfo
{
    [[self dl_Association]setKey:objectKey imageKey:colorKey selector:selector withUserInfo:userInfo];
}
- (void)dl_setKey:(NSString *)objectKey imageKey:(NSString *)colorKey block:(DLThemeBlock)block withUserInfo:(NSDictionary *)userInfo
{
    [[self dl_Association]setKey:objectKey imageKey:colorKey block:block withUserInfo:userInfo];
}




- (DLThemeAssociationsManager *)dl_Association
{
    DLThemeAssociationsManager *association = objc_getAssociatedObject(self, @selector(dl_Association));
    if (association == nil) {
        association = [DLThemeAssociationsManager managerWithObject:self];
        objc_setAssociatedObject(self, @selector(dl_Association), association, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return association;
}



@end
