//
//  PopularViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/31.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController {
    
    func setPopularViewTabBarItem(viewController view:UIViewController ) {
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:"热门", image:UIImage(named:"tabBar_friendTrends.png") , selectImage: UIImage(named: "tabBar_friendTrends_highLight.png"))
        
        view.tabBarItem = tabBarItem
        
        
    }
    
    func setPopularViewNavigationItem(viewController view:UIViewController?) {
        
        NavigationItemConfig.setNavigationItem(title: "热门" , navigationItem: view?.navigationItem)
        
    }
    
}
