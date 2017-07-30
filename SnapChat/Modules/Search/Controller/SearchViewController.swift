//
//  SearchController.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/26.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    func SetSearchViewTabBarItem(title:String? , image:UIImage? , selectImage:UIImage?) -> UITabBarItem {
        
        let tabBarItem = TabBarConfig.SetTabBarItem(title: title, image: image, selectImage: selectImage)
        
        return tabBarItem
        
    }
    
}
