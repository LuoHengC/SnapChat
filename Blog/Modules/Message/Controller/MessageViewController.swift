//
//  MessageViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/30.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    func setMessageViewTabBarItem(viewController view:UIViewController) {
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:"消息",
            image: UIImage(named:"tabBar_friendTrends.png"),
            selectImage: UIImage(named: "tabBar_friendTrends_highLight.png"))
        
        view.tabBarItem = tabBarItem
        
    }
    
    func setMessageViewNavigationItem(viewController view:UIViewController?) {
        
        NavigationItemConfig.setNavigationItem(title: "消息" , navigationItem: view?.navigationItem)
    }
    
}
