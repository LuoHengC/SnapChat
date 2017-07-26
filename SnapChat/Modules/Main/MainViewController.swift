//
//  ViewController.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/4.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    class func AddMainViewTabBar(childController:UITabBarController , title:String , imageName:String)
    {
        childController.title = title;
        
        childController.tabBarItem.image = UIImage(named: imageName)
        
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highLight")
        
        childController.tabBar.tintColor = UIColor.gray
        
        let navigation = UINavigationController(rootViewController: childController)
        
        navigation.tabBarItem.title = title
        
        
    
    }
    

}

