//
//  LoginWindowController.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/9.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "LoginWindowController.h"
#import "LoginViewController.h"

@interface LoginWindowController ()
@property (nonatomic, strong) LoginViewController *homeVC;
@end

@implementation LoginWindowController


+ (instancetype)windowController {
    
    NSUInteger style =  NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskFullSizeContentView;
    NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, kLoginW, kLoginH) styleMask:style backing:NSBackingStoreBuffered defer:YES];
    window.title = @"hello";
    
    ///< window 的按钮的隐藏
    [[window standardWindowButton:NSWindowZoomButton] setHidden:YES];
    [[window standardWindowButton:NSWindowMiniaturizeButton] setHidden:YES];

    window.titleVisibility = NSWindowTitleHidden; // 隐藏“Window”
    window.titlebarAppearsTransparent = YES;
    
    //有阴影
    [window setHasShadow:YES];
    //设置为点击背景可以移动窗口
    [window setMovableByWindowBackground:YES];
    
    LoginWindowController *cc = [[LoginWindowController alloc] initWithWindow:window];
    [cc.window makeKeyAndOrderFront:nil];
    [cc.window center];
    
    ///<  刚开始显示登录页面
    cc.homeVC = [[LoginViewController alloc] init];
    cc.window.contentViewController = cc.homeVC;
    return cc;
}



@end
