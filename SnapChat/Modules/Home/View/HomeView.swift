//
//  HomeView.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        let homeViewController = HomeViewController()
        
        let tabBarItem = homeViewController.SetHomeViewTabBarItem(title: "主页",
        image: UIImage(named:"tabBar_home.png"),
        selectImage: UIImage(named: "tabBar_home_highLight.png"))
        
        let navigationItem = homeViewController.SetHomeViewNavigationItem(title: "主页")
        
        self.navigationItem.title = navigationItem.title
        
        self.tabBarItem = tabBarItem
        
    }
    
   convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.blue
        
    }
    
}
