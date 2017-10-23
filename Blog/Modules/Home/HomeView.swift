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
    static let defaultColor : UIColor = ConstColor.white
    static let isScrollEnable : Bool = true
    
}

class HomeView: UIView {
    
    let controllers:[UIViewController]
    let topBarHeight:CGFloat
    let tabHeight:CGFloat
    var scrollViewRect:CGRect = CGRect(x: 0, y: 0, width: 0, height: 0 )
    
    weak var delegate:NavTitleViewButtonProtocol?
    
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
    
    //显示在导航栏中间的view
    var navTitleView :UIView?
    
    init(viewControllers:[UIViewController] , topHeight:CGFloat , tabBarHeight:CGFloat){
        
        controllers = viewControllers
        topBarHeight = topHeight
        tabHeight = tabBarHeight
        
        super.init(frame: UIScreen.main.bounds)
        
        scrollViewRect = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y + topBarHeight, width: self.bounds.size.width, height: self.bounds.size.height - topBarHeight - tabHeight)
        
        setUp()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView{
    
    func setUp() {
        
        setScrollViewFrame()
        setUpView()
        setScrollViewContentView()
        setNavTitleView()
        
    }
    
    func setUpView() {
        
        self.backgroundColor = HomeViewOptions.defaultColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setNavTitleView() {
        
        navTitleView = UIView(frame: CGRect(x: 0, y: 0, width: ConstButtonSize.navTitleButtonSize.width * CGFloat(controllers.count), height: ConstButtonSize.navTitleButtonSize.height))
        
        navTitleView?.backgroundColor = .clear
        
        addBtn(to: navTitleView)
        
    }
    
    func setScrollViewFrame() {
        
        homeScrollView.frame = scrollViewRect
        homeScrollView.contentSize = CGSize(width: homeScrollView.frame.width * CGFloat(controllers.count), height: homeScrollView.frame.height)
        
    }
    
    func setScrollViewContentView() {
        
        homeScrollView.backgroundColor = HomeViewOptions.defaultColor
        homeScrollView.isScrollEnabled = HomeViewOptions.isScrollEnable
        
        self.addSubview(homeScrollView)
        
        /**
         scrollView在设置了isPagingEnabled后，每一页的大小就为自身bounds的大小，水平或垂直的滚动距离是一页bounds的整数倍
         */
        
        for ( index ,viewController) in controllers.enumerated()  {
            
            let x = homeScrollView.frame.size.width * CGFloat(index)
            
            viewController.view.frame = CGRect(x: x, y: 0, width: scrollViewRect.size.width, height: scrollViewRect.size.height)
            viewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            homeScrollView.addSubview(viewController.view)
            
        }
        
    }
    
    func addBtn(to titleView:UIView?) {
        
        for (index , viewController) in controllers.enumerated() {
            
            let button = createNavTitleBtn(title: viewController.title, tag: index)
            
            button.frame.origin.x = button.frame.size.width * CGFloat(index)
            
            titleView?.addSubview(button)
            
        }
        
    }
    
    func createNavTitleBtn(title:String? ,tag:Int) -> UIButton {
        
        let button  = UIButton(type: .custom)
        
        button.frame = CGRect(x: 0, y: 0, width: ConstButtonSize.navTitleButtonSize.width, height: ConstButtonSize.navTitleButtonSize.height)
        
        let attributes = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: ConstFontSize.fontSize)]
        
        if let strTitle = title{
            
            let attributedString = NSAttributedString(string: strTitle, attributes: attributes)
            
            button.setAttributedTitle(attributedString, for: .normal)
            
        }
        
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(navTitleBtnOnClick(_:)), for: .touchUpInside)
        button.tag = tag
        
        return button
        
    }
    
}

extension HomeView{
    
    @objc func navTitleBtnOnClick(_ sender:UIButton) {
        
        if let delegate = self.delegate {
            
            delegate.navTitleButtonOnClick(sender)
            
        }
    }
    
}
