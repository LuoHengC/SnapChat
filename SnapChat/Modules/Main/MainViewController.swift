//
//  ViewController.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/4.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

final class MainViewController: UITabBarController
{
    
    class func addMainViewTabBar(childController:[UIViewController] ) -> [UIViewController]
    {
        var tabBarArrary:[UIViewController] = []
        
        for (viewController) in childController
        {
            let navigation = UINavigationController(rootViewController: viewController)
            
            tabBarArrary.append(navigation)
        }
        return tabBarArrary
    }

}

