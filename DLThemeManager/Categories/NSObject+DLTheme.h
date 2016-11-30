//
//  NSObject+DLTheme.h
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import <Foundation/Foundation.h>
#import "DLThemeManager.h"
#import "UIColor+DLTheme.h"
#import "DLThemeAssociation.h"


@interface NSObject (DLTheme)
- (void)dl_setKey:(NSString *)objectKey colorKey:(NSString *)colorKey selector:(SEL)selector withUserInfo:(NSDictionary *)userInfo;
- (void)dl_setKey:(NSString *)objectKey colorKey:(NSString *)colorKey block:(DLThemeBlock)block withUserInfo:(NSDictionary *)userInfo;
- (void)dl_setKey:(NSString *)objectKey imageKey:(NSString *)colorKey selector:(SEL)selector withUserInfo:(NSDictionary *)userInfo;
- (void)dl_setKey:(NSString *)objectKey imageKey:(NSString *)colorKey block:(DLThemeBlock)block withUserInfo:(NSDictionary *)userInfo;
@end
