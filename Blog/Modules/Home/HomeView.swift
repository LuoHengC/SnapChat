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
    
        self.controllers = viewControllers
        
        super.init(frame: UIScreen.main.bounds)
        
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
        layoutContentScrollView()
        print(homeScrollView.frame)
        
    }
    
    func setUpView() {
        
        self.backgroundColor = HomeViewOptions.defaultColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setScrollViewContentView() {
        
        homeScrollView.backgroundColor = .red
        homeScrollView.isScrollEnabled = HomeViewOptions.isScrollEnable
//        homeScrollView.frame = self.frame
        self.addSubview(homeScrollView)
        
    }
    
    func layoutContentScrollView() {
    
//        NSLayoutConstraint.init(item: homeScrollView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1.0, constant: 0).isActive = true
//        NSLayoutConstraint.init(item: homeScrollView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1.0, constant: 0).isActive = true
//        NSLayoutConstraint.init(item: homeScrollView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1.0, constant: 0).isActive = true
//        NSLayoutConstraint.init(item: homeScrollView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1.0, constant: 0).isActive = true
       
        
    }
    
    func constructPagingViewControllers() {
        
        for (_ , viewController) in controllers.enumerated() {
            
            if have(view: viewController.view){
                
                viewController.willMove(toParentViewController: nil)
                viewController.view.removeFromSuperview()
                viewController.removeFromParentViewController()
                
            }
            
        }
        
    }
    
    func have(view:UIView) -> Bool {

        return self.subviews.contains(view)

    }
    
}
