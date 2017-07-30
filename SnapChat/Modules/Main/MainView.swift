//
//  MainView.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MainView: UITabBarController
{
    override func viewDidLoad() {
        
        let viewControllerArray:[UIViewController] = [HomeView() , SearchView() , MessageView()]
        
        self.viewControllers = MainViewController.AddMainViewTabBar(childController: viewControllerArray)
    }
    
    override func didReceiveMemoryWarning() {
        
    }
}
