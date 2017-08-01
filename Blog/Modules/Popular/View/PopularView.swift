//
//  DicoveryView.swift
//  Blog
//
//  Created by Vayne on 2017/7/31.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class PopularView: UIViewController {
    
    init(){
        
        super.init(nibName: nil, bundle: nil)
        
        let popularViewController = PopularViewController()
        
        popularViewController.setPopularViewTabBarItem(viewController:self)
        
        popularViewController.setPopularViewNavigationItem(viewController: self)
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
        
    }
    
}
