//
//  SearchView.swift
//  SnapChat
//
//  Created by Vayne on 2017/7/26.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class SearchView: UIViewController {
    
    required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.tabBarItem = UITabBarItem(title: "搜索", image: UIImage(named:"tabBar_friendTrends.png"), selectedImage: UIImage(named: "tabBar_friendTrends_highLight.png"))
        
        self.view.backgroundColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        
    }
    
}
