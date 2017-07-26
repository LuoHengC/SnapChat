//
//  ViewController.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/4.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController
{
    
    class func AddMainViewTabBar(childController:[UIViewController] , title:String , imageName:String)->UITabBarController
    {
        
        let tabBar = UITabBarController()
        
        for viewController in childController
        {
            let navigation = UINavigationController(rootViewController: viewController)
            
            let tarBarItem = UITabBarItem(title: title, image:UIImage(named:imageName), selectedImage:UIImage(named: imageName + "_highLight"))
            
            navigation.tabBarItem = tarBarItem
            
            tabBar.tabBar.tintColor = UIColor.gray
            
            tabBar.addChildViewController(navigation)
            
        }
        
        return tabBar
        
    }

}

