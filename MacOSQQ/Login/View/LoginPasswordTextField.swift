//
//  LoginPasswordTextField.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/23.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class LoginPasswordTextField: NSSecureTextField,NSTextFieldDelegate {

    let placeholder = "输入密码"
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.delegate = self;
    }
    
    override func mouseDown(with event: NSEvent) {
        //< 选中所有的文字
        self.currentEditor()?.selectAll(nil)
        self.placeholderString = ""
    }
    
    //< 结束编辑的时候显示  placeholder
    func controlTextDidEndEditing(_ obj: Notification) {
        self.placeholderString = placeholder
    }
    
}
