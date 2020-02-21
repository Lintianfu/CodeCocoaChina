//
//  LoginViewController.m
//  CodeCocoaChina
//
//  Created by Mr.TF on 2020/2/21.
//  Copyright © 2020 Mr.TF. All rights reserved.
//

#import "LoginViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
#import <Masonry/Masonry.h>
#import <SDAutoLayout/SDAutoLayout.h>
#define MAS_SHORTHAN
#define MAS_SHORTHAND_GLOBALS
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kTextFieldWidth [UIScreen mainScreen].bounds.size.width * 0.87
#define kTextFieldHeight 40
#define kTextLeftPadding [UIScreen mainScreen].bounds.size.width * 0.055
#define kRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kForgetPwdBtnWidth [UIScreen mainScreen].bounds.size.width * 0.3
// 输入框距离顶部的高度
#define kTopHeight
@interface LoginViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)IQKeyboardReturnKeyHandler *returnKeyHandler;
@property (nonatomic,strong)UIScrollView *contentScrollView;
@property (strong, nonatomic) AVPlayer *player;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong)UITextField *pwdTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self.player play];
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [self initWithReturnKeyBoardManager];
}
-(AVPlayer *)player
{
    if(_player==nil)
    {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"register_guide_video.mp4" ofType:nil];
        NSURL *url=[NSURL fileURLWithPath:path];
        AVPlayerItem *playItem = [AVPlayerItem playerItemWithURL:url];
        _player = [AVPlayer playerWithPlayerItem:playItem];
        _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;// 永不暂停
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:_player];
        layer.frame = self.view.bounds;
        [self.view.layer insertSublayer:layer atIndex:0];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playToEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

    }
    return _player;
}
- (UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,kScreenW , kScreenH)];
        _contentScrollView.delegate = self;
        _contentScrollView.contentSize = CGSizeMake(kScreenW, kScreenH);
        _contentScrollView.userInteractionEnabled =  YES;
        [self.view addSubview:_contentScrollView];
    }
    
    return _contentScrollView;
}

-(void)initWithReturnKeyBoardManager
{
    self.returnKeyHandler=[[IQKeyboardReturnKeyHandler alloc]initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType=UIReturnKeyDone;
}
-(void)setupView
{
    self.view.backgroundColor=[UIColor whiteColor];
    _nameTextField=[UITextField new];
    _nameTextField.placeholder=@"手机号/邮箱";
    _nameTextField.font=[UIFont systemFontOfSize:16];
    _nameTextField.borderStyle=UITextBorderStyleNone;
    [self.contentScrollView addSubview:self.nameTextField];
    _nameTextField.sd_layout
    .widthIs(kTextFieldWidth)
    .heightIs(kTextFieldHeight)
    .topSpaceToView(self.contentScrollView,kTextFieldWidth)
    .leftSpaceToView(self.contentScrollView, kTextLeftPadding);
    
    UIView *sepView1 = [[UIView alloc]init];
    sepView1.backgroundColor = [UIColor whiteColor];
    [self.contentScrollView addSubview:sepView1];
    sepView1.sd_layout
    .widthIs(kTextFieldWidth)
    .heightIs(1.5)
    .topSpaceToView(_nameTextField, 0)
    .leftSpaceToView(self.contentScrollView, kTextLeftPadding);
    
    _pwdTextField = [[UITextField alloc]init];
    _pwdTextField.placeholder = @"密码";
    _pwdTextField.secureTextEntry = YES;
    _pwdTextField.font = [UIFont systemFontOfSize:16.0f];
    _pwdTextField.borderStyle = UITextBorderStyleNone;
    [self.contentScrollView addSubview:_pwdTextField];
    _pwdTextField.sd_layout
    .widthIs(kTextFieldWidth)
    .heightIs(kTextFieldHeight)
    .leftSpaceToView(self.contentScrollView, kTextLeftPadding)
    .topSpaceToView(sepView1 ,20);
    
    //2.1 添加一个分割线
    UIView *sepView2 = [[UIView alloc]init];
    sepView2.backgroundColor = [UIColor whiteColor];
    [self.contentScrollView addSubview:sepView2];
    sepView2.sd_layout
    .widthIs(kTextFieldWidth)
    .heightIs(1.5)
    .leftSpaceToView(self.contentScrollView, kTextLeftPadding)
    .topSpaceToView(_pwdTextField, 0);
  
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = kRGBColor(24, 154, 204);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 3;
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.contentScrollView addSubview:loginBtn];
    loginBtn.sd_layout
    .widthIs(kForgetPwdBtnWidth)
    .heightIs(kTextFieldHeight)
    .leftSpaceToView(self.contentScrollView, self.view.frame.size.width/3)
    .topSpaceToView(sepView2, 30);
   
    UIButton *forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPwdBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [forgetPwdBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPwdBtn addTarget:self action:@selector(forgetPwdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [forgetPwdBtn setTitleColor:kRGBColor(24, 154, 214) forState:UIControlStateNormal];
    [self.contentScrollView addSubview:forgetPwdBtn];
    forgetPwdBtn.sd_layout
    .widthIs(kForgetPwdBtnWidth)
    .heightIs(kTextFieldHeight)
    .leftSpaceToView(self.contentScrollView, kTextLeftPadding)
    .topSpaceToView(loginBtn, 10);
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [registBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(registBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [registBtn setTitleColor:kRGBColor(24, 154, 214) forState:UIControlStateNormal];
    [self.contentScrollView addSubview:registBtn];
    registBtn.sd_layout
    .widthIs(kForgetPwdBtnWidth)
    .heightIs(kTextFieldHeight)
    .topSpaceToView(loginBtn, 10)
    .rightSpaceToView(self.self.contentScrollView, kTextLeftPadding);
}
- (void)loginBtnClick
{
    
}
- (void)registBtnClick
{
    
}
- (void)forgetPwdBtnClick
{
    
}
- (void)playToEnd
{
    [self.player seekToTime:kCMTimeZero];
}

-(void)dealloc
{
    self.returnKeyHandler=nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
