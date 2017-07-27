//
//  HomeView.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
    
    required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.tabBarItem = UITabBarItem(title: "主页", image: UIImage(named:"tabBar_home.png"), selectedImage: UIImage(named: "tabBar_home_highLight.png"))
        
        self.view.backgroundColor = UIColor.blue
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        
        
    }
    
}
