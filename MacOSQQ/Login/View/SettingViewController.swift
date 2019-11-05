//
//  SettingViewController.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/25.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class SettingItem: NSCollectionViewItem {
    
    var chooseText:HDButton!
    var chooseBut:HDButton!
    
    var contentStr : String!{
        didSet {
            chooseText.title = contentStr
            if contentStr == "记住密码" {
                chooseBut.state = .on
            }
        }
    }
    
    override func loadView() {
        view = NSView.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView() {
        chooseBut = HDButton(frame: NSRect(x: 0, y: 5, width: 14, height: 14))
        chooseBut.setButtonType(.switch)
        view.addSubview(chooseBut)
        
        chooseText = HDButton(frame: NSRect(x: 15, y: 0, width: 65, height: 24))
        view.addSubview(chooseText)
    }
    
    //< 前面的—— @objc
    @objc func closeAction(_ sender: NSButton) {
    }
}

class SettingViewController: NSViewController {
    
    let dataSource = ["记住密码","忘记密码","自动登录","注册账号"]
    var collection: NSCollectionView!

    lazy var scrollView: NSScrollView = NSScrollView.init(frame: NSRect(x: 10, y: 10, width: view.width - 20, height: view.height - 20))

    //< 初始化view
    override func loadView() {
        let rect = NSApplication.shared.mainWindow?.frame
        let vRect = NSRect(x: rect?.origin.x ?? 0, y: (rect?.origin.y ?? 0) - 22, width: rect?.size.width ?? 0, height: 78)
        view = NSView.init(frame: vRect)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        createView()
    }
    
    
    func createView() {
        let flowLayout = NSCollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = NSSize.init(width: 80, height: 24)

        let collection = NSCollectionView.init()
        collection.frame = NSRect(x: 10, y: 10, width: view.width - 20, height: view.height - 20)
        collection.collectionViewLayout = flowLayout
        collection.isSelectable = true
        collection.delegate = self
        collection.dataSource = self

        collection.register(SettingItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier.init("SettingItem"))
        
        let clipView = NSClipView.init(frame: NSRect(x: 10, y: 10, width: view.width - 20, height: view.height - 20))
        clipView.documentView = collection;
        scrollView.contentView = clipView;
        view.addSubview(scrollView)
    }
    
}


extension SettingViewController:NSCollectionViewDelegate,NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier.init("SettingItem"), for: indexPath) as! SettingItem
        item.contentStr = dataSource[indexPath.item]
        return item
    }
    
    // 点击方法
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        print("items select")
    }
}
