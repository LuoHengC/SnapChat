//
//  SearchController.swift
//  Blog
//
//  Created by Vayne on 2017/7/26.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    func setSearchViewTabBarItem(viewController view:UIViewController){
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:"搜索",
            image: UIImage(named:"tabBar_friendTrends.png"),
            selectImage: UIImage(named: "tabBar_friendTrends_highLight.png"))

        view.tabBarItem = tabBarItem
        
    }
    
    func setSearchViewNavigationItem(viewController view:UIViewController?) {
        
        NavigationItemConfig.setNavigationItem(title: "搜索" , navigationItem: view?.navigationItem)
        
    }
    
}
