//
//  SearchController.swift
//  Blog
//
//  Created by Vayne on 2017/7/26.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    func setSearchViewTabBarItem(title:String?, image:UIImage? , selectImage:UIImage?) -> UITabBarItem {
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:title, image: image, selectImage: selectImage)
        
        return tabBarItem
    }
    
    func setSearchViewNavigationItem(title:String?) -> UINavigationItem {
        
        let navigationItem = NavigationItemConfig.setNavigationItem(title: title)
        
        return navigationItem
        
    }
    
}
