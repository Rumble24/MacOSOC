//
//  MainToolBarView.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/29.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

protocol MainToolBarViewDelegate {
    func mainToolBarViewClickMsgBut()
    func mainToolBarViewClickMemberBut()
    func mainToolBarViewClickOtherButBut()
}

class MainToolBarView: HDView {
    
    var delegate: MainToolBarViewDelegate?
    var searchView: SearchTextField!
    var msgBut:HDButton!
    var memberBut:HDButton!
    var otherBut:HDButton!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView () {
        backgroundColor = NSColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
        searchView = SearchTextField(frame: NSRect(x: 100, y: 15, width: 124, height: 24))
        addSubview(searchView)
        
        msgBut = HDButton(frame: NSRect(x: 250, y: 15, width: 25, height: 25))
        msgBut.setButtonType(.toggle)
        msgBut.state = .on
        msgBut.target = self
        msgBut.action = #selector(msgButAction(_:))
        msgBut.image = NSImage(named: "application_gray")
        msgBut.alternateImage = NSImage(named: "application_blue")
        addSubview(msgBut)
        
        memberBut = HDButton(frame: NSRect(x: 310, y: 15, width: 25, height: 25))
        memberBut.setButtonType(.toggle)
        memberBut.target = self
        memberBut.action = #selector(memberButAction(_:))
        memberBut.image = NSImage(named: "friend_gray")
        memberBut.alternateImage = NSImage(named: "friend_blue")
        addSubview(memberBut)
        
        otherBut = HDButton(frame: NSRect(x: 370, y: 15, width: 25, height: 25))
        otherBut.setButtonType(.toggle)
        otherBut.target = self
        otherBut.action = #selector(otherButAction(_:))
        otherBut.image = NSImage(named: "message_gray")
        otherBut.alternateImage = NSImage(named: "message_blue")
        addSubview(otherBut)
    }
    
    @objc func msgButAction(_ sender: NSButton) {
        sender.state = .on
        memberBut.state = .off
        otherBut.state = .off
        if let delegate = self.delegate {
            delegate.mainToolBarViewClickMsgBut()
        }
    }
    
    @objc func memberButAction(_ sender: NSButton) {
        msgBut.state = .off
        sender.state = .on
        otherBut.state = .off
        if let delegate = self.delegate {
            delegate.mainToolBarViewClickMemberBut()
        }
    }
    
    @objc func otherButAction(_ sender: NSButton) {
        msgBut.state = .off
        memberBut.state = .off
        sender.state = .on
        if let delegate = self.delegate {
            delegate.mainToolBarViewClickOtherButBut()
        }
    }
}
