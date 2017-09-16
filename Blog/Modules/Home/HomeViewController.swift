//
//  HomeViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit


class HomeViewController :UIViewController  {
    
    init(){
        
        super.init(nibName: nil, bundle: nil)
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:"主页",image: UIImage(named:"tabBar_home.png"),selectImage: UIImage(named: "tabBar_home_highLight.png"))
        
        self.tabBarItem = tabBarItem
        
        NavigationItemConfig.setNavigationLeftButton(navigationItem: self.navigationItem)
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}
