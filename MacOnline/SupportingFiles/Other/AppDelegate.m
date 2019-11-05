//
//  AppDelegate.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/8.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginWindowController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    ///< 设置显示的主窗口
    self.mainWindowController = [LoginWindowController windowController];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
