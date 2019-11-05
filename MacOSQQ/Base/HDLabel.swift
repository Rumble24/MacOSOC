//
//  HDLabel.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/30.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class HDLabel: NSTextField {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.isEditable = false
        self.isBordered = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
