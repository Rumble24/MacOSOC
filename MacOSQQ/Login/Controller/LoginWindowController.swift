//
//  LoginWindowController.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/22.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class LoginWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        //< 隐藏按钮
        window?.standardWindowButton(.closeButton)?.isHidden = true
        window?.standardWindowButton(.miniaturizeButton)?.isHidden = true
        window?.standardWindowButton(.zoomButton)?.isHidden = true

        //< 使窗口移动
        window?.isMovableByWindowBackground = true
        
        //< 改变背景颜色
        window?.backgroundColor = .white
        
    }

}
