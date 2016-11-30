//
//  DLThemeAssociation.m
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import "DLThemeAssociation.h"


NSString *DLThemeAssociationColorKey = @"DLThemeAssociationColorKey";
NSString *DLThemeAssociationImageKey = @"DLThemeAssociationImageKey";
NSString *DLThemeAssociationSelKey = @"DLThemeAssociationSelKey";
NSString *DLThemeAssociationBlockKey = @"DLThemeAssociationBlockKey";
NSString *DLThemeAssociationUserInfoKey = @"DLThemeAssociationUserInfofKey";

@implementation DLThemeAssociation

- (void)updateTheme
{
}

@end

@implementation DLThemeColorAssociation

- (void)updateTheme
{
    UIColor *color = [[DLThemeManager sharedManager] colorForKey:self.colorKey];
    if (self.block) {
        self.block(color, self);
        return;
    }
    if (self.selector) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.object performSelector:self.selector withObject:color withObject:self];
#pragma clang diagnostic pop
    }
}

@end


@implementation DLThemeImageAssociation

- (void)updateTheme
{
    UIImage *newImage = [[DLThemeManager sharedManager] imageForKey:self.imageKey];
    if (self.block) {
        self.block(newImage, self);
        return;
    }
    if (self.selector) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.object performSelector:self.selector withObject:newImage withObject:self];
#pragma clang diagnostic pop
    }
}

@end





@interface DLThemeAssociationsManager()
@property (nonatomic, strong) NSMutableDictionary *themeKeyMapper;
@end

@implementation DLThemeAssociationsManager


- (instancetype)init
{
    self = [super init];
    if (self) {
          [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateTheme) name:DLThemeManagerThemeDidChanged object:nil];
        self.themeKeyMapper = [NSMutableDictionary dictionary];
    }
    return self;
}



+ (instancetype)managerWithObject:(NSObject *)object
{
    DLThemeAssociationsManager *manager = [DLThemeAssociationsManager new];
    manager.object = object;
    return manager;
}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:DLThemeManagerThemeDidChanged object:nil];
}

- (void)updateTheme
{
    [self.themeKeyMapper enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        DLThemeAssociation *association = obj;
        [association updateTheme];
    }];
}


- (void)setKey:(NSString *)key colorKey:(NSString *)colorKey selector:(SEL)selector withUserInfo:(NSDictionary *)userInfo
{
    DLThemeColorAssociation *association = [DLThemeColorAssociation new];
    association.object = self.object;
    association.key = key;
    association.colorKey = colorKey;
    association.selector = selector;
    association.userInfo = userInfo;
    self.themeKeyMapper[colorKey] = association;
}
- (void)setKey:(NSString *)key colorKey:(NSString *)colorKey block:(DLThemeBlock)block withUserInfo:(NSDictionary *)userInfo
{
    DLThemeColorAssociation *association = [DLThemeColorAssociation new];
    association.object = self.object;
    association.key = key;
    association.colorKey = colorKey;
    association.block = block;
    association.userInfo = userInfo;
    self.themeKeyMapper[colorKey] = association;
}
- (void)setKey:(NSString *)key imageKey:(NSString *)imageKey selector:(SEL)selector withUserInfo:(NSDictionary *)userInfo
{
    DLThemeImageAssociation *association = [DLThemeImageAssociation new];
    association.object = self.object;
    association.key = key;
    association.imageKey = imageKey;
    association.selector = selector;
    association.userInfo = userInfo;
    self.themeKeyMapper[imageKey] = association;
}
- (void)setKey:(NSString *)key imageKey:(NSString *)imageKey block:(DLThemeBlock)block withUserInfo:(NSDictionary *)userInfo
{
    DLThemeImageAssociation *association = [DLThemeImageAssociation new];
    association.object = self.object;
    association.key = key;
    association.imageKey = imageKey;
    association.block = block;
    association.userInfo = userInfo;
    self.themeKeyMapper[imageKey] = association;
}



@end
