//
//  NavigationItemConfig.swift
//  Blog
//
//  Created by Vayne on 2017/7/30.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class NavigationItemConfig: UINavigationController {
    
    class func setNavigationItem(title:String? , navigationItem:UINavigationItem?){
        
        guard let _ = title, let _ = navigationItem else {
            return
        }
        
        navigationItem?.title = title
        
        let item = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: nil)
        
        navigationItem?.leftBarButtonItem = item
        
    }
    
}
