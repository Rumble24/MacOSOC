//
//  LoginHeaderCollection.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/28.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

class LoginHeaderItem: HDCollectionViewItem {
    
    typealias UserBlcok = (_ sender :Any, _ imgName:String) -> Void
    var deleteBlock: UserBlcok?
    var headerBlock: UserBlcok?
    var closeBut:HDButton!
    var headerBut:LoginImageButton!
    var imageStr: String! {
        didSet {
            headerBut.image = NSImage(named: imageStr)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView() {
        headerBut = LoginImageButton(frame: NSRect(x: 0, y: 0, width: 40, height: 40))
        headerBut.target = self
        headerBut.action = #selector(headerAction(_:))
        view.addSubview(headerBut)
        
        closeBut = HDButton(image: NSImage(named: "close")!, target: self, action: #selector(closeAction(_:)))
        closeBut.frame = NSRect(x: 0, y: 40 - 10, width: 10, height: 10)
        view.addSubview(closeBut)
    }
    
    @objc func closeAction(_ sender: NSButton) {
        if let b = deleteBlock {
            b(sender,imageStr)
        }
    }
    
    @objc func headerAction(_ sender: NSButton) {
        if let b = headerBlock {
            b(sender,imageStr)
        }
    }
}


protocol LoginHeaderCollectionDelegate {
    func loginHeaderCollectionClickItem(item:LoginHeaderItem,imageName:String,indexPath: IndexPath)
}

class LoginHeaderCollection: NSView {
    
    lazy var scrollerView: NSScrollView = NSScrollView.init(frame: NSRect(x: 0, y: 0, width: 158, height: 100))
    var coll: NSCollectionView!
    var delegate: LoginHeaderCollectionDelegate?
    var data = ["2_01","2_02","2_03","2_04","2_05","2_06"]
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView()  {
        let flowLayout = NSCollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = NSSize(width: 40, height: 40)
        
        coll = NSCollectionView.init()
        coll.frame = NSRect(x: 0, y: 0, width: 158, height: 100)
        coll.delegate = self
        coll.dataSource = self
        coll.collectionViewLayout = flowLayout
        coll.isSelectable = true
        coll.register(LoginHeaderItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier.init("LoginHeaderItem"))
        
        let clipView = NSClipView.init(frame: bounds)
        clipView.documentView = coll
        scrollerView.contentView = clipView
        addSubview(scrollerView)
    }
    
}

extension LoginHeaderCollection:NSCollectionViewDelegate,NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier.init("LoginHeaderItem"), for: indexPath) as! LoginHeaderItem
        item.imageStr = data[indexPath.item]
        item.deleteBlock = { (sender,imageName) -> Void in
            self.data.remove(at: indexPath.item)
            self.coll.reloadData()
        }
        item.headerBlock = { (sender,imageName) -> Void in
            if let delegate = self.delegate {
                delegate.loginHeaderCollectionClickItem(item: item,imageName: self.data[indexPath.item],indexPath: indexPath)
            }
        }
        return item
    }
    

}
