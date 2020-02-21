//
//  GesturePasswordViewController.m
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/21.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import "GesturePasswordViewController.h"
#import "GesturePassword.h"
#import "LoginViewController.h"
@interface GesturePasswordViewController ()
{
    GesturePassword *_passWord;
}
@end

@implementation GesturePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *blueColor = [UIColor colorWithRed:0/255.0f green:160/255.0f blue:229/255.0f alpha:1];
    UIColor *ligntBlueColor = [UIColor colorWithRed:181/255.0f green:224/255.0f blue:244/255.0f alpha:1];
    UIColor *redColor = [UIColor colorWithRed:253/255.0f green:106/255.0f blue:95/255.0f alpha:1];
    
    //密码输入
    _passWord = [[GesturePassword alloc] init];
    _passWord.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
    _passWord.center = self.view.center;
    _passWord.itemBackGoundColor = ligntBlueColor;
    _passWord.itemCenterBallColor = blueColor;
    _passWord.lineNormalColor = blueColor;
    _passWord.lineErrorColor = redColor;
    [self.view addSubview:_passWord];
    __weak typeof (self)weekSelf = self;
    [_passWord addPasswordBlock:^(NSString *password) {
        [weekSelf showPassword:password];
    }];
    
}
- (void)showPassword:(NSString *)password {
    if([password isEqualToString:@"0124678"])
    {
        [UIApplication sharedApplication].windows[0].rootViewController=[LoginViewController new];
        
    }
    else{
        [_passWord showError];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
