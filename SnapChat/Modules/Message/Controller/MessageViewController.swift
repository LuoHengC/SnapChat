//
//  MessageViewController.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/30.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    func SetMessageViewTabBarItem(title:String? , image:UIImage? , selectImage:UIImage?) -> UITabBarItem {
        
        let tabBarItem = TabBarConfig.SetTabBarItem(title: title, image: image, selectImage: selectImage)
        
        return tabBarItem
        
    }
    
}
