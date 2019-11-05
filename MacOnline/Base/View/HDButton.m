//
//  HDButton.m
//  MacOnline
//
//  Created by 王景伟 on 2019/10/10.
//  Copyright © 2019 王景伟. All rights reserved.
//

#import "HDButton.h"

@implementation HDButton

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    self.bordered = NO;
    self.imageScaling = NSImageScaleAxesIndependently;
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
