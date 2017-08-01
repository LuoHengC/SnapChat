//
//  SearchView.swift
//  Blog
//
//  Created by Vayne on 2017/7/26.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class SearchView: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        let searchViewController = SearchViewController()
        
        let tabBarItem = searchViewController.setSearchViewTabBarItem(title:"搜索",
        image: UIImage(named:"tabBar_friendTrends.png"),
        selectImage: UIImage(named: "tabBar_friendTrends_highLight.png"))
        
        let navigationItem = searchViewController.setSearchViewNavigationItem(title: "搜索")
        
        self.navigationItem.title = navigationItem.title
        
        self.tabBarItem = tabBarItem
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.black
        
    }
    
}
