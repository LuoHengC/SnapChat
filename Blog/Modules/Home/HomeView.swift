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
    
    let controllers:[UIViewController]
    let topBarHeight:CGFloat
    let tabHeight:CGFloat
    
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
    
    init(viewControllers:[UIViewController] , topHeight:CGFloat , tabBarHeight:CGFloat){
        
        controllers = viewControllers
        topBarHeight = topHeight
        tabHeight = tabBarHeight
        
        super.init(frame: UIScreen.main.bounds)
        
        setScrollViewFrame()
        
        setUp()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView{
    
    func setUp() {
        
        setUpView()
        setScrollViewContentView()
        print(homeScrollView.frame)
        print(homeScrollView.contentSize)
    }
    
    func setUpView() {
        
        self.backgroundColor = HomeViewOptions.defaultColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setScrollViewContentView() {
        
        homeScrollView.backgroundColor = .red
        homeScrollView.isScrollEnabled = HomeViewOptions.isScrollEnable
        self.addSubview(homeScrollView)
        
    }
    
    func setScrollViewFrame() {
        
        homeScrollView.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y + topBarHeight, width: self.bounds.size.width, height: self.bounds.size.height - topBarHeight - tabHeight)
        
        homeScrollView.contentSize = CGSize(width: homeScrollView.frame.width * CGFloat(controllers.count), height: homeScrollView.frame.height)
            
    }
    
}
