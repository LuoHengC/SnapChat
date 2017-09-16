//
//  PopularViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/31.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class PopularViewController : UIViewController {
    
    init(){
        
        super.init(nibName: nil, bundle: nil)
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:"热门", image:UIImage(named:"tabBar_friendTrends.png") , selectImage: UIImage(named: "tabBar_friendTrends_highLight.png"))
        
        self.tabBarItem = tabBarItem
        
        NavigationItemConfig.setNavigationItem(title: "热门" , navigationItem: self.navigationItem)
        
        NavigationItemConfig.setNavigationLeftButton(navigationItem: self.navigationItem)
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}
