//
//  HDButton.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/24.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class HDButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.isBordered = false
        self.imageScaling = .scaleAxesIndependently;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
