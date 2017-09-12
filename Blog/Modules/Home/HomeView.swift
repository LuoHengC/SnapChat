//
//  HomeView.swift
//  Blog
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
    
    init(){
        
        super.init(nibName: nil, bundle: nil)
        
        let homeViewController = HomeViewController()
        
        homeViewController.setHomeViewTabBarItem(viewController: self)
        
        homeViewController.setHomeViewNavigationItem(viewController: self)
        
    }
    
   convenience required init?(coder aDecoder: NSCoder) {
    
        self.init()
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
}
