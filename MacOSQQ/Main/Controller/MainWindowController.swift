//
//  MainWindowController.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/24.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    //此处设置TitleBarHeight
    let kTitlebarHeight: CGFloat = 54.0
    //调节button按钮初始x轴坐标
    var buttonOriginX: CGFloat = 12.0
    //三个按钮数字
    var buttons: [NSButton]!
    
    class func windowController() -> MainWindowController {
    
        let rect = NSApplication.shared.mainWindow!.frame

        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: rect.width, height: rect.height), styleMask: [.titled,.closable,.miniaturizable,.resizable,.fullSizeContentView], backing: .buffered, defer: false)

        //< 使窗口移动
        window.isMovableByWindowBackground = true
        
        //< 改变背景颜色
        window.backgroundColor = .white
        
        window.titlebarAppearsTransparent = true
        
        window.minSize = NSSize(width: mainW, height: mainH)

        let mainWindowVC = MainWindowController(window: window)
        mainWindowVC.window?.animationBehavior = .documentWindow
        mainWindowVC.window?.makeFirstResponder(nil)
        mainWindowVC.window?.center()
        
        let vc = MainViewController(nibName: "MainViewController", bundle: nil)
        mainWindowVC.contentViewController = vc
        
        window.delegate = mainWindowVC
        mainWindowVC.updateTitleBarOfWindow(window: window, fullScreen: false)
        mainWindowVC.buttons = [
            (window.standardWindowButton(.closeButton))!,
            (window.standardWindowButton(.miniaturizeButton))!,
            (window.standardWindowButton(.zoomButton))!
        ]
        
        return mainWindowVC
    }
    
    func updateTitleBarOfWindow(window: NSWindow ,fullScreen: Bool) {
        let kFullScreenButtonYOrigin: CGFloat = 3.0
        let windowFrame = window.frame
        let titlebarContainerView = window.standardWindowButton(.closeButton)?.superview?.superview;
        var titlebarContainerFrame = titlebarContainerView?.frame
        titlebarContainerFrame?.origin.y = windowFrame.size.height - kTitlebarHeight
        titlebarContainerFrame?.size.height = CGFloat(kTitlebarHeight)
        titlebarContainerView?.frame = titlebarContainerFrame!
        
        var buttonX:CGFloat = buttonOriginX
        let closeButton = window.standardWindowButton(.closeButton)
        let minimizeButton = window.standardWindowButton(.miniaturizeButton)
        let zoomButton = window.standardWindowButton(.zoomButton)
        
        for buttonView in [closeButton,minimizeButton,zoomButton] {
            var btnFrame = buttonView?.frame
            let f: CGFloat = round((kTitlebarHeight - (btnFrame?.size.height)!) / 2.0)
            btnFrame?.origin.y = fullScreen ? kFullScreenButtonYOrigin : f
            btnFrame?.origin.x = CGFloat(buttonX)
            buttonX = (btnFrame?.size.width)! + 6 + buttonX
            
            buttonView?.setFrameOrigin((btnFrame?.origin)!)
        }
    }
}

extension MainWindowController: NSWindowDelegate {
    func windowDidEnterFullScreen(_ notification: Notification) {
        updateTitleBarOfWindow(window: window!, fullScreen: true)
    }
    func windowWillExitFullScreen(_ notification: Notification) {
        _ = buttons.map{$0.isHidden = true}
    }
    func windowDidExitFullScreen(_ notification: Notification) {
        self.updateTitleBarOfWindow(window: self.window!, fullScreen: false)
        _ = buttons.map{$0.isHidden = false}
    }
    func windowDidResize(_ notification: Notification) {
        updateTitleBarOfWindow(window: window!, fullScreen: false)
    }
}
