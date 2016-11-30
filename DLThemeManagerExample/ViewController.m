//
//  ViewController.m
//  DLThemeManagerExample
//
//  Created by famulei on 20/10/2016.
//
//

#import "ViewController.h"
#import "UIView+DLTheme.h"
#import "DLThemeManager.h"
#import "UILabel+DLTheme.h"
#import "UIButton+DLTheme.h"
#import "UIImageView+DLTheme.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundThemeKey = @"bgColor";
    self.label.textColorThemeKey = @"textColor";
    [self.imageView dl_setImageKey:@"icon"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)change:(id)sender {
    
    [DLThemeManager swicthThemeWithName:@"Black"];
}

@end
