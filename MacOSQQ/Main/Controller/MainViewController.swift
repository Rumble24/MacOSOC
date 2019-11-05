//
//  MainViewController.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/25.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    var toolBarView: MainToolBarView!
    var contentTabView: NSTabView!
    
    override func loadView() {
        view = NSView.init(frame: NSRect(x: 0, y: 0, width: mainW, height: mainH))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView() {
        toolBarView = MainToolBarView()
        toolBarView.delegate = self
        toolBarView.frame = NSRect(x: 0, y: view.height - 54, width: view.width, height: 54)
        view.addSubview(toolBarView)
        toolBarView.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.offset()(54)
        }
        
        contentTabView = NSTabView()
        contentTabView.tabViewType = .noTabsNoBorder
        contentTabView.tabViewBorderType = .none
        contentTabView.frame = NSRect(x: 0, y: 0, width: view.width, height: view.height - 54)
        let messageVC = MessageViewController()
        let friendsVC = MemberViewController()
        let applicationsVC = OtherViewController()
        let messageItem = NSTabViewItem(viewController: messageVC)
        let friendsItem = NSTabViewItem(viewController: friendsVC)
        let applicationsItem = NSTabViewItem(viewController: applicationsVC)
        contentTabView.addTabViewItem(messageItem)
        contentTabView.addTabViewItem(friendsItem)
        contentTabView.addTabViewItem(applicationsItem)
        contentTabView.selectTabViewItem(at: 0)
        view.addSubview(contentTabView)
    }
}

extension MainViewController: MainToolBarViewDelegate {
    func mainToolBarViewClickMsgBut() {
        contentTabView.selectTabViewItem(at: 0)
    }
    
    func mainToolBarViewClickMemberBut() {
        contentTabView.selectTabViewItem(at: 1)
    }
    
    func mainToolBarViewClickOtherButBut() {
        contentTabView.selectTabViewItem(at: 2)
    }
}
