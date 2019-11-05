//
//  LoginImageButton.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/23.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class LoginImageButton: HDButton {
    
    //当鼠标移进个人图标里是的颜色
    let mouseEnteredColor = NSColor(red:0.44, green:0.84, blue:0.95, alpha:1.00)
    //当鼠标不在个人图像时的边框颜色
    let defaultColor = NSColor(red:0.72, green:0.75, blue:0.77, alpha:1.00)
    //边框宽度
    let borderWidth: CGFloat = 2
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        layer?.cornerRadius = dirtyRect.width / 2.0
        
        //< 鼠标进入 移除的方法
        let trackingArea = NSTrackingArea(rect: bounds, options: [.mouseEnteredAndExited,.activeInActiveApp], owner: self, userInfo: nil)
        addTrackingArea(trackingArea)
        
        changeColor(color: defaultColor, width: borderWidth)        
    }
    
    override func mouseEntered(with event: NSEvent) {
        changeColor(color: mouseEnteredColor, width: borderWidth)
    }
    
    override func mouseExited(with event: NSEvent) {
        changeColor(color: defaultColor, width: borderWidth / 2.0)
    }
    
    func changeColor(color: NSColor, width: CGFloat) {
        layer?.borderColor = color.cgColor
        layer?.borderWidth = width
    }
    
}
