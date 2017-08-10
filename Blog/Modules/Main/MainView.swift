//
//  MainView.swift
//  Blog
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MainView: UITabBarController
{
    override func viewDidLoad() {
        
        let viewControllerArray:[UIViewController] = [HomeView(), SearchView(), MessageView(), PopularView()]
        
        self.viewControllers = MainViewController.addMainViewTabBar(childController: viewControllerArray)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
}
