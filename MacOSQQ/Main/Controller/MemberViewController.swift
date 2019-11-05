//
//  MemberViewController.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/29.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class MemberViewController: NSViewController {

    var addBut: NSButton!
    var addMenu: NSMenu!

    
    override func loadView() {
        view = NSView.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView() {
        addBut = NSButton(frame: NSRect(x: 18, y: mainH - 40 - 54, width: 165, height: 30))
        addBut.bezelStyle = .shadowlessSquare
        addBut.title = "添加好友"
        addBut.target = self
        addBut.action = #selector(addButAction(_:))
        view.addSubview(addBut)
    }
    
    //< 头像的点击方法
    @objc func addButAction(_ sender: NSButton) {
        let theMenu = NSMenu(title: "Add Friend Menu")
        theMenu.addItem(withTitle: "添加联系人/群", action: #selector(handleMenu(_:)), keyEquivalent: "")
        theMenu.addItem(withTitle: "创建群", action: #selector(handleMenu(_:)), keyEquivalent: "")
        theMenu.addItem(withTitle: "创建讨论组", action: #selector(handleMenu(_:)), keyEquivalent: "")
        theMenu.popUp(positioning: nil, at: NSPoint(x: 0, y: 40), in: sender)
    }
    
    
    @objc func handleMenu(_ item: NSMenuItem) {
        
    }
}
