//
//  HomeViewController.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    func setHomeViewTabBarItem(title:String?, image:UIImage? , selectImage:UIImage?) -> UITabBarItem {
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:title, image: image, selectImage: selectImage)
        
        return tabBarItem
        
    }
    
    func setHomeViewNavigationItem(title:String?) -> UINavigationItem {
        
        let navigationItem = NavigationItemConfig.setNavigationItem(title: title)
        
        return navigationItem
        
    }
    
}
