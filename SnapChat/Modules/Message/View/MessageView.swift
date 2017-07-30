//
//  MessageView.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/30.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MessageView: UIViewController {
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        let messageViewController = MessageViewController()
        
        let tabBarItem = messageViewController.SetMessageViewTabBarItem(title: "消息",
        image: UIImage(named:"tabBar_friendTrends.png"),
        selectImage: UIImage(named: "tabBar_friendTrends_highLight.png"))
        
        self.tabBarItem = tabBarItem
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.orange
        
    }
    
}
