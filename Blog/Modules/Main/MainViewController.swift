//
//  ViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/4.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

final class MainViewController: UITabBarController
{
    
    class func addMainViewTabBar(childControllers:[UIViewController] ) -> [UIViewController]
    {
        var tabBarArrary:[UIViewController] = []
        
        for (viewController) in childControllers
        {
            let navigation = UINavigationController(rootViewController: viewController)
            
            tabBarArrary.append(navigation)
        }
        return tabBarArrary
    }

}

