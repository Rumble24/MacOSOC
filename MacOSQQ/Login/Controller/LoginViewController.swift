//
//  LoginViewController.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/24.
//  Copyright © 2019 王景伟. All rights reserved.
//  248 * 316
//  还有一个显示头像的collectionview 点击
//  158 * 100
//  存在的问题:  5.mouthdown不执行

import Cocoa

class LoginViewController: NSViewController {
    
    private static let sound = NSSound(named: NSSound.Name.init("登录状态切换的音效.mp3"))
    var closeBut: HDButton!
    var headerColl: LoginHeaderCollection!
    var headerBut: LoginImageButton!
    var accountTextField: LoginAccountTextField!
    var passwordTextField: LoginPasswordTextField!
    var loginButton: HDButton!
    var showButton: HDButton!
    var line1: NSView!
    var line2: NSView!
    var itemRect: NSRect?
    var itemIndex: IndexPath = IndexPath(item: 0, section: 0)
    let headerRect = NSRect(x: (248 - 100) / 2.0, y: 316 - 40 - 100, width: 100, height: 100)
    
    lazy var settingWindow: NSWindow = {
        let window = NSWindow(contentRect: NSMakeRect((self.view.window?.frame.origin.x)!, (self.view.window?.frame.origin.y)!+99, (self.view.window?.frame.size.width)!, 78), styleMask: [.titled], backing: .buffered, defer: true)
        
        window.contentViewController = SettingViewController()
        window.backgroundColor = .white
        self.view.window?.addChildWindow(window, ordered: .below)
        return window
    } ()
    
    override func viewWillAppear() {
        super.viewWillAppear()
        detectLoginButtonState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        
        addObserverToView()
    }
    
    func createView() {
        view.wantsLayer = true;
        
        //< 关闭按钮
        closeBut = HDButton(image: NSImage(named: "close")!, target: self, action: #selector(closeAction(_:)))
        closeBut.frame = NSRect(x: 9, y: view.height - 9 - 14, width: 14, height: 14)
        view.addSubview(closeBut)
        
        headerColl = LoginHeaderCollection.init()
        headerColl.delegate = self
        headerColl.isHidden = true
        headerColl.frame = NSRect(x: (view.width - 158) / 2.0, y: view.height - 40 - 100, width: 158, height: 100)
        view.addSubview(headerColl)
        
        //< 头像
        headerBut = LoginImageButton(frame: headerRect)
        headerBut.image = NSImage(named: "avater")
        headerBut.target = self
        headerBut.action = #selector(headerButAction(_:))
        view.addSubview(headerBut)
        
        //< 输入账号  27 + 29 = 56 / 2 = 28
        accountTextField = LoginAccountTextField(frame: NSRect(x: (view.width - 180) / 2.0, y: view.height - 40 - 100 - 40 - 28, width: 180, height: 28))
        accountTextField.font = NSFont.systemFont(ofSize: 13)
        accountTextField.isBordered = false
        accountTextField.placeholderString = "输入账号"
        accountTextField.focusRingType = .none
        accountTextField.stringValue = "123123"
        view .addSubview(accountTextField)
        
        passwordTextField = LoginPasswordTextField(frame: NSRect(x: (view.width - 180) / 2.0, y: view.height - 40 - 100 - 40 - 28 - 20 - 28, width: 152, height: 28))
        passwordTextField.font = NSFont.systemFont(ofSize: 13)
        passwordTextField.isBordered = false
        passwordTextField.placeholderString = "输入密码"
        passwordTextField.stringValue = "123123"
        passwordTextField.focusRingType = .none
        view.addSubview(passwordTextField)
        
        //< 登陆
        loginButton = HDButton(image: NSImage(named: "enterButton")!, target: self, action: #selector(loginAction(_:)))
        loginButton.frame = NSRect(x: (view.width - 180) / 2.0 + 156, y: passwordTextField.top + 7, width: 20, height: 20)
        view.addSubview(loginButton)
        
        showButton = HDButton(image: NSImage(named: "Login_down")!, target: self, action: #selector(downAction(_:)))
        showButton.frame = NSRect(x: (view.width - 13) / 2.0, y: 26, width: 13, height: 7.5)
        view.addSubview(showButton)
        
        line1 = NSView(frame: NSRect(x: (view.width - 180) / 2.0, y: view.height - 40 - 100 - 40 - 27, width: 180, height: 1))
        line1.backgroundColor = NSColor.lightGray
        view.addSubview(line1)
        
        line2 = NSView(frame: NSRect(x: (view.width - 180) / 2.0, y: view.height - 40 - 100 - 40 - 28 - 20 - 28, width: 180, height: 1))
        line2.backgroundColor = NSColor.lightGray
        view.addSubview(line2)
    }
    
    
    func addObserverToView() {
        NotificationCenter.default.addObserver(forName: NSText.didChangeNotification, object: nil, queue: OperationQueue.main) { (noti) in
            self.detectLoginButtonState()
        }
    }
    
    func detectLoginButtonState() {
        if !self.accountTextField.stringValue.isEmpty && !self.passwordTextField.stringValue.isEmpty {
            self.loginButton.isEnabled = true
        }else {
            self.loginButton.isEnabled = false
        }
    }
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        print(" mouseDown  ")
    }
}

//< 按钮的点击方法
extension LoginViewController {
    //< 头像的点击方法
    @objc func headerButAction(_ sender: NSButton) {
        //设置运行后所显示的个人图像
        let firstItem = self.headerColl.coll.item(at: itemIndex)
        itemRect = self.view.convert((firstItem?.view.frame)!, from: headerColl.coll)
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            context.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            headerBut.animator().frame = itemRect!
        }, completionHandler:{
            self.headerColl.isHidden = false
            self.headerBut.isHidden = true
        })
    }
    
    //< 前面的—— @objc
    @objc func closeAction(_ sender: NSButton) {
        NSApp.terminate(sender)
    }
    
    @objc func loginAction(_ sender: NSButton) {
        let mainWindow = MainWindowController.windowController()
        mainWindow.window?.orderFront(nil)
        view.window?.orderOut(nil)
    }
    
    //< 显示 设置的
    @objc func downAction(_ sender: NSButton) {
        LoginViewController.sound?.play()
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            context.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            if sender.state == .on {
                self.settingWindow.animator().setFrame(NSMakeRect((self.view.window?.frame.origin.x)!, (self.view.window?.frame.origin.y)!-78, (self.view.window?.frame.size.width)!, 100), display: true)
                self.view.window?.animator().addChildWindow(self.settingWindow, ordered: .below)
            } else {
                view.window?.removeChildWindow(self.settingWindow)
                self.settingWindow.animator().setFrame(NSMakeRect((self.view.window?.frame.origin.x)!, (self.view.window?.frame.origin.y)!+22, (self.view.window?.frame.size.width)!, 0), display: false)
            }
        }, completionHandler: nil)
    }
}

extension LoginViewController: LoginHeaderCollectionDelegate {
    func loginHeaderCollectionClickItem(item:LoginHeaderItem,imageName:String,indexPath: IndexPath) {
        headerBut.image = NSImage(named: imageName)
        itemIndex = indexPath
        
        headerColl.isHidden = true
        headerBut.isHidden = false
        
        itemRect = self.view.convert(item.view.frame, from: headerColl.coll)

        headerBut.frame = itemRect ?? headerRect
        NSAnimationContext.runAnimationGroup({ (context) in
            context.duration = 0.5
            context.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            headerBut.animator().frame = headerRect
        }, completionHandler:{
            
        })
        
        print(indexPath.item)
    }
}
