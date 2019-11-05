//
//  main.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/8.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    NSApplication *app = [NSApplication sharedApplication];
    id delegate = [[AppDelegate alloc] init];
    app.delegate = delegate;
    return NSApplicationMain(argc, argv);
}
