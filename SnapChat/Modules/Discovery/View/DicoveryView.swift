//
//  DicoveryView.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/31.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class DiscoveryView: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        let discoveryViewController = DiscoveryViewController()
        
        let tabBarItem = discoveryViewController.setDiscoveryViewTabBarItem(title:"发现",
        image: UIImage(named:"tabBar_friendTrends.png"),
        selectImage: UIImage(named: "tabBar_friendTrends_highLight.png"))
        
        let navigationItem = discoveryViewController.setDiscoveryViewNavigationItem(title: "发现")
        
        self.navigationItem.title = navigationItem.title
        
        self.tabBarItem = tabBarItem
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.green
        
    }
    
}
