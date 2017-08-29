//
//  HomeViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit


class HomeViewController  {
    
    func setHomeViewTabBarItem(viewController view:UIViewController){
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:"主页",
            image: UIImage(named:"tabBar_home.png"),
            selectImage: UIImage(named: "tabBar_home_highLight.png"))
        
        view.tabBarItem = tabBarItem
        
    }
    
    func setHomeViewNavigationItem(viewController view:UIViewController?) {
        
        NavigationItemConfig.setNavigationItem(title: "主页" , navigationItem: view?.navigationItem)
        
        NavigationItemConfig.setNavigationLeftButton(navigationItem: view?.navigationItem)
    }
    
}
