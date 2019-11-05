//
//  LoginViewController.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/8.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "LoginViewController.h"
#import "HDMainWindowController.h"
#import "HDMessageModel.h"

@interface LoginViewController ()

@property (nonatomic, strong) NSImageView *headImageView;

@property (nonatomic, strong) NSTextField *accordTextField;

@property (nonatomic, strong) NSTextField *codeTextField;

@end

@implementation LoginViewController

///< 不会初始化View
- (void)loadView {
    NSRect rect = [[[NSApplication sharedApplication] mainWindow] frame];
    self.view = [[NSView alloc]initWithFrame:rect];
    self.view.wantsLayer            = YES;
    self.view.layer.cornerRadius    = 5.0;
    self.view.layer.masksToBounds   = YES;
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headImageView = NSImageView.new;
    self.headImageView.frame = CGRectMake((self.view.width - 100) / 2.0, self.view.height - 130, 100, 100);
    self.headImageView.wantsLayer = YES;
    self.headImageView.layer.cornerRadius  = self.headImageView.bounds.size.width / 2;
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.borderWidth   = 2;
    self.headImageView.layer.borderColor   = [NSColor lightGrayColor].CGColor;
    self.headImageView.image = [NSImage imageNamed:@"rabbit"];
    [self.view addSubview:self.headImageView];
    
    self.accordTextField = [[NSTextField alloc]initWithFrame:CGRectMake((self.view.width - 100) / 2.0, self.view.height - 180, 100, 30)];
    self.accordTextField.placeholderString = @"账户";
    self.accordTextField.stringValue = @"15985140091";
    [self.view addSubview:self.accordTextField];
    
    self.codeTextField = [[NSTextField alloc]initWithFrame:CGRectMake((self.view.width - 100) / 2.0, self.view.height - 230, 100, 30)];
    self.codeTextField.stringValue = @"1111";
    self.codeTextField.placeholderString = @"验证码";
    [self.view addSubview:self.codeTextField];
    
    NSButton *button = [[NSButton alloc]initWithFrame:NSMakeRect((self.view.width - 100) / 2.0 + 120, self.view.height - 230, 30, 30)];
    [button setImage:[NSImage imageNamed:@"LoginButton"]];
    [button setTarget:self];
    button.bordered = NO;
    [button setAction:@selector(buttonClick)];
    [self.view addSubview:button];
}


- (void)buttonClick {
    
    NSString *accord = self.accordTextField.stringValue;
    NSString *code = self.codeTextField.stringValue;
    
    if ([NSString isBlankString:accord] || [NSString isBlankString:code]) {
        [self alert:@"账户或验证码不能为空"];
        return;
    }
    
    //发起网络请求
    NSDictionary *dictionary1 = @{@"phone": STRING_NIL(self.accordTextField.stringValue),
                                  @"type": @"login",
                                  @"isvoice": @"0"};
    
    [[HDHttpManager sharedInstance] GET:kGetInentifyCode dict:dictionary1 succeed:^(id  _Nonnull data) {
        HDMessageModel *model = [HDMessageModel yy_modelWithJSON:data];
        if (model.errorNumber == 0) {
            if (model.isNewPhone) {
                [self alert:@"账号未注册"];
            } else {
                [self login];
            }
        } else {
            [self alert:model.errorMsg];
        }
    } failure:^(NSString * _Nonnull errorMsg) {
        [self alert:errorMsg];
    }];
}

- (void)login {
    //发起网络请求
    NSDictionary *dictionary = @{@"phone": STRING_NIL(self.accordTextField.stringValue),
                                 @"identify_code": STRING_NIL(self.codeTextField.stringValue)};
    
    [[HDHttpManager sharedInstance] POST:kIdentifyCodeLogin dict:dictionary succeed:^(id  _Nonnull data) {
        HDMessageModel *model = [HDMessageModel yy_modelWithJSON:data];
        if (model.errorNumber == 0) {
            [HDAccountTool saveLoginInfo:model.userModel];
            [self pushToMainController];
        } else {
            [self alert:model.errorMsg];
        }
    } failure:^(NSString * _Nonnull errorMsg) {
        [self alert:errorMsg];
    }];
}

- (void)pushToMainController {
    // 1.创建聊天界面窗口控制器
    HDMainWindowController *chatWinControl = [HDMainWindowController windowController];
    
    // 2.强引用这个Window，不然这个Window会在跳转之后的瞬间被销毁
    AppDelegate *appDelegate = (AppDelegate *)[NSApplication sharedApplication].delegate;
    appDelegate.mainWindowController = chatWinControl;
    
    // 3.设为KeyWindow并前置
    [chatWinControl.window makeKeyAndOrderFront:self];
    
    // 4.关闭现在的登录窗口
    [self.view.window orderOut:self];
}

- (void)alert:(NSString *)text {
    NSAlert *alert = [NSAlert new];
    [alert addButtonWithTitle:@"知道了"];
    [alert setMessageText:text];
    [alert beginSheetModalForWindow:[self.view window] completionHandler:^(NSModalResponse returnCode) {
        
    }];
}
@end
