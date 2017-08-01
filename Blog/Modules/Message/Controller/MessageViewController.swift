//
//  MessageViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/30.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    func setMessageViewTabBarItem(title:String?, image:UIImage? , selectImage:UIImage?) -> UITabBarItem {
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:title, image: image, selectImage: selectImage)
        
        return tabBarItem
        
    }
    
    func setMessageViewNavigationItem(title:String?) -> UINavigationItem {
        
        let navigationItem = NavigationItemConfig.setNavigationItem(title: title)
        
        return navigationItem
        
    }
    
}
