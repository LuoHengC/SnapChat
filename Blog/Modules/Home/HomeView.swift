//
//  HomeView.swift
//  Blog
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

fileprivate struct HomeViewOptions {
    
    static let defaultPage : Int = 0
    static let defaultColor : UIColor = .white
    static let isScrollEnable : Bool = true
    
}

class HomeView: UIView {
    
    let viewControllers:[UIViewController]
    
    let homeScrollView : UIScrollView = {
        
        $0.isPagingEnabled = true
        $0.isDirectionalLockEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.scrollsToTop = false
        $0.bounces = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
        
    }(UIScrollView(frame: .zero))
    
    init(viewControllers:[UIViewController]){
    
        self.viewControllers = viewControllers
        
        super.init(frame: UIScreen.main.bounds)
        
        setUp()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        setUpView()
        setScrollViewContentView()
        
    }
    
    func setUpView() {
        
        self.backgroundColor = HomeViewOptions.defaultColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setScrollViewContentView() {
        
        homeScrollView.backgroundColor = HomeViewOptions.defaultColor
        homeScrollView.isScrollEnabled = HomeViewOptions.isScrollEnable
        
        self.addSubview(homeScrollView)
        
    }
    
    func layoutContentScrollView() {
        
        
        
    }
    
}
