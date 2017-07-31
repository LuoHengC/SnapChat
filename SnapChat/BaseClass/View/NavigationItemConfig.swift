//
//  NavigationItemConfig.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/30.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class NavigationItemConfig: UINavigationController {
    
    class func setNavigationItem(title:String?) -> UINavigationItem {
        
        guard let _ = title else {
            return UINavigationItem(title: "错误")
        }
        
        let navigationItem = UINavigationItem()
        
        navigationItem.title = title
        
        return navigationItem
        
    }
    
}
