//
//  TabBarConfig.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/30.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class TabBarConfig: UITabBarController {
    
    class func setTabBarItem(title:String?, image:UIImage?, selectImage:UIImage?) ->UITabBarItem {
        
        guard let _ = title, let _ = image , let _ = selectImage else {
            return UITabBarItem(title: "错误", image: nil, selectedImage: nil)
        }
        
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectImage)
        
        return tabBarItem
    }
    
}
