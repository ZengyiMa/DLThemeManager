//
//  DLThemeManager.m
//  DLThemeManager
//
//  Created by famulei on 20/10/2016.
//
//

#import "DLThemeManager.h"













const NSString *DLThemeManagerThemeDidChanged = @"DLThemeManagerThemeDidChanged";


@interface DLTheme ()

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) NSDictionary *colorKeys;
@property (nonatomic, strong) NSDictionary *imageKeys;

@end
@implementation DLTheme

- (instancetype)initWithBundleName:(NSString *)bundleName
{
    return [self initWithBundlePath:[[NSBundle mainBundle]pathForResource:bundleName ofType:@"bundle"]];
}

- (instancetype)initWithBundlePath:(NSString *)bundlePath
{
    self = [super init];
    if (self) {
        
        if (bundlePath) {
            self.bundle = [NSBundle bundleWithPath:bundlePath];
            [self.bundle load];
        }
        else
        {
            self.bundle = [NSBundle mainBundle];
        }
    }
    return self;
}


// 根据图片名字和bundle来获取图片   核心代码来自YYImage
+ (UIImage *)imageWithName:(NSString *)name bundle:(NSBundle *)bundle
{
    if (name.length == 0) return nil;
    if ([name hasSuffix:@"/"]) return nil;
    
    NSString *nameWithoutPathExtension = name.stringByDeletingPathExtension;
    NSString *ext = name.pathExtension;
    NSString *path = nil;
    CGFloat scale = 1;
    
    NSArray *exts = ext.length > 0 ? @[ext] : @[@"", @"png", @"jpg", @"jpeg", @"gif", @"webp", @"apng"];
    static NSArray *scales;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat screenScale = [UIScreen mainScreen].scale;
        if (screenScale <= 1) {
            scales = @[@1,@2,@3];
        } else if (screenScale <= 2) {
            scales = @[@2,@3,@1];
        } else {
            scales = @[@3,@2,@1];
        }
    });
    
    for (int s = 0; s < scales.count; s++) {
        scale = ((NSNumber *)scales[s]).floatValue;
        NSString *scaledName = [nameWithoutPathExtension stringByAppendingFormat:@"@%@x", @(scale)];
        for (NSString *e in exts) {
            path = [bundle pathForResource:scaledName ofType:e];
            if (path) break;
        }
        if (path) break;
    }
    if (path.length == 0) return nil;
    return [UIImage imageNamed:path];
}


- (UIColor *)colorForKey:(NSString *)key
{
    NSParameterAssert(key);
    NSString *colorString = self.colorKeys[key];
    return [UIColor dl_colorWithHexString:colorString];
}

- (UIImage *)imageForKey:(NSString *)key
{
    NSParameterAssert(key);
    NSString *imageName = self.imageKeys[key];
    return [DLTheme imageWithName:imageName bundle:self.bundle];
}

- (NSDictionary *)colorKeys
{
    if (!_colorKeys) {
        _colorKeys = [NSDictionary dictionaryWithContentsOfFile:[self.bundle pathForResource:@"color" ofType:@"plist"]];
    }
    return _colorKeys;
}

- (NSDictionary *)imageKeys
{
    if (!_imageKeys) {
        _imageKeys = [NSDictionary dictionaryWithContentsOfFile:[self.bundle pathForResource:@"image" ofType:@"plist"]];
    }
    return _imageKeys;
}

- (void)dealloc
{
    [self.bundle unload];
}

@end





@interface DLThemeManager ()
@end


@implementation DLThemeManager

+ (DLThemeManager *)sharedManager
{
    static DLThemeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DLThemeManager new];
    });
    return manager;
}

+ (void)swicthThemeWithName:(NSString *)themeName
{
    DLTheme *theme = [[DLTheme alloc]initWithBundleName:themeName];
    [DLThemeManager sharedManager].theme = theme;
}

- (void)setTheme:(DLTheme *)theme
{
    _theme = theme;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter]postNotificationName:(NSString *)DLThemeManagerThemeDidChanged object:nil];
    });
}

- (UIColor *)colorForKey:(NSString *)key
{
    return [self.theme colorForKey:key];
}

- (UIImage *)imageForKey:(NSString *)key
{
    return [self.theme imageForKey:key];
}






@end
