//
//  HomeViewController.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    func SetHomeViewTabBarItem(title:String? , image:UIImage? , selectImage:UIImage?) -> UITabBarItem {
        
        let tabBarItem = TabBarConfig.SetTabBarItem(title: title, image: image, selectImage: selectImage)
        
        return tabBarItem
        
    }
    
    func SetHomeViewNavigationItem(title:String?) -> UINavigationItem {
        
        let navigationItem = NavigationItemConfig.SetNavigationItem(title: title)
        
        return navigationItem
        
    }
    
}
