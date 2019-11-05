//
//  HDMainWindowController.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/9.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDMainWindowController.h"
#import "HDMainViewController.h"

@interface HDMainWindowController ()

@end

@implementation HDMainWindowController

+ (instancetype)windowController {
    
    NSUInteger style =  NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable;
    float w = [[NSScreen mainScreen] frame].size.width/2;
    float h = [[NSScreen mainScreen] frame].size.height/2;
    NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, w, h) styleMask:style backing:NSBackingStoreBuffered defer:YES];
    window.title = @"";
    
    HDMainWindowController *cc = [[HDMainWindowController alloc] initWithWindow:window];
    [cc.window setAnimationBehavior:NSWindowAnimationBehaviorDocumentWindow];
    [cc.window makeFirstResponder:nil];
    // 居中
    [cc.window center];
    
    HDMainViewController *mainVC = [[HDMainViewController alloc] init];
    [cc.window setContentViewController:mainVC];
    
    return cc;
}


/// xib方法才会调用
- (void)windowDidLoad {
    [super windowDidLoad];
}



@end
