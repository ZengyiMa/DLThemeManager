//
//  DLThemeAssociation.h
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import <Foundation/Foundation.h>
#import "DLThemeManager.h"


typedef void(^DLThemeBlock)(id newObject, DLThemeAssociation *association);


@interface DLThemeAssociation : NSObject
@property (nonatomic, assign) NSObject *object;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, copy) DLThemeBlock block;
- (void)updateTheme;
@end

@interface DLThemeColorAssociation : DLThemeAssociation
@property (nonatomic, copy) NSString *colorKey;
@end

@interface DLThemeImageAssociation : DLThemeAssociation
@property (nonatomic, copy) NSString *imageKey;
@end


@interface DLThemeAssociationsManager : NSObject

@property (nonatomic, assign) NSObject *object;

+ (instancetype)managerWithObject:(NSObject *)object;

- (void)setKey:(NSString *)key colorKey:(NSString *)colorKey selector:(SEL)selector withUserInfo:(NSDictionary *)userInfo;
- (void)setKey:(NSString *)key colorKey:(NSString *)colorKey block:(DLThemeBlock)block withUserInfo:(NSDictionary *)userInfo;
- (void)setKey:(NSString *)key imageKey:(NSString *)colorKey selector:(SEL)selector withUserInfo:(NSDictionary *)userInfo;
- (void)setKey:(NSString *)key imageKey:(NSString *)colorKey block:(DLThemeBlock)block withUserInfo:(NSDictionary *)userInfo;
@end
