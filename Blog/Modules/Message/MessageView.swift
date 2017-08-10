//
//  MessageView.swift
//  Blog
//
//  Created by Vayne on 2017/7/30.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MessageView: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        let messageViewController = MessageViewController()
        
        messageViewController.setMessageViewTabBarItem(viewController: self)
        
        messageViewController.setMessageViewNavigationItem(viewController: self)
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}
