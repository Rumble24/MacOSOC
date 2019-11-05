//
//  SearchTextField.swift
//  QQ
//
//  Created by mac on 2018/1/20.
//  Copyright © 2018年 shibiao. All rights reserved.
//

import Cocoa

class SearchTextField: NSView {
    let searchImageView = NSImageView(image: #imageLiteral(resourceName: "04"))
    var textField:NSTextField!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        backgroundColor = .white
        layer?.cornerRadius = 12
        layer?.masksToBounds = true
        
        textField = NSTextField.init()
        textField.isBordered = false
        textField.focusRingType = .none
        textField.delegate = self;
        addSubview(textField)
        textField.mas_makeConstraints { (make) in
            make?.left.equalTo()(self)?.offset()(12)
            make?.right.equalTo()(self)?.offset()(-12)
            make?.top.equalTo()(self)?.offset()(4)
            make?.bottom.equalTo()(self)
        }
        
        //添加搜索图片
        searchImageView.frame = NSRect(x: 10, y: 2, width: 20, height: 20)
        addSubview(searchImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        print(" controlTextDidBeginEditing ")

    }
}


extension SearchTextField : NSTextFieldDelegate {
    func controlTextDidBeginEditing(_ obj: Notification) {
        print(" controlTextDidBeginEditing ")
    }
    
    func controlTextDidEndEditing(_ obj: Notification) {
        print(" controlTextDidEndEditing ")
    }
}
