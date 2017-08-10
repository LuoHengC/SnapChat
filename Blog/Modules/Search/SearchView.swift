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
        
        searchViewController.setSearchViewNavigationItem(viewController: self)
        
        searchViewController.setSearchViewTabBarItem(viewController: self)
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
}
