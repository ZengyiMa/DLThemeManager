//
//  DLThemeManager.h
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import <UIKit/UIKit.h>
#import "UIColor+DLTheme.h"

FOUNDATION_EXTERN NSString *DLThemeManagerThemeDidChanged;

@class DLThemeAssociation;

@interface DLTheme : NSObject
- (instancetype)initWithBundleName:(NSString *)bundleName;
- (instancetype)initWithBundlePath:(NSString *)bundlePath NS_DESIGNATED_INITIALIZER;

- (UIColor *)colorForKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;

@end




@interface DLThemeManager : NSObject


@property (nonatomic, strong) DLTheme *theme;


+ (DLThemeManager *)sharedManager;

- (UIColor *)colorForKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;


+ (void)swicthThemeWithName:(NSString *)themeName;

@end
