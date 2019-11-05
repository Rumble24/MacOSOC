//
//  HDClassRoomController.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/10.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDClassRoomController.h"

@interface HDClassRoomController ()

@end

@implementation HDClassRoomController

///< 不会初始化View
- (void)loadView {
    self.view = [[NSView alloc]initWithFrame:NSMakeRect(0, 0, 700, 900)];
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor yellowColor].CGColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
