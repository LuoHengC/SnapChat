//
//  HomeViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class HomeViewController :UIViewController ,UIScrollViewDelegate ,NavTitleViewButtonProtocol {
    
    let viewControllers:[UIViewController]
    var homeView:HomeView?
    
    init(){
        
        viewControllers = [HomePageViewController() , LiveViewController()]
        
        super.init(nibName: nil, bundle: nil)
        
        setUp()
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewWillLayoutSubviews() {
        setUpViewController()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let navigationHeight = self.navigationController?.navigationBar.frame.height
        let tabBarHeight = self.tabBarController?.tabBar.frame.height
        
        if let navHeight = navigationHeight , let tabHeight = tabBarHeight
        {
            homeView = HomeView(viewControllers: viewControllers, topHeight: navHeight + ConstScreenSize.statusBarHeight, tabBarHeight: tabHeight)
            
            if let home = homeView
            {
                home.homeScrollView.delegate = self
                home.delegate = self
                
                self.view.addSubview(home)
                self.navigationItem.titleView = home.navTitleView
            }
        }
    }
}

extension HomeViewController{
    
    func setUp() {
        
        let tabBarItem = TabBarConfig.setTabBarItem(title: "主页",image: UIImage(named:"tabBar_home.png"),selectImage: UIImage(named: "tabBar_home_highLight.png"))
        
        self.tabBarItem = tabBarItem
        
        NavigationItemConfig.setNavigationLeftButton(navigationItem: self.navigationItem)
        
    }
    
    func setUpViewController() {
        
        for viewController in viewControllers {
            
            if have(viewController: viewController)
            {
                continue
            }
            
            guard let _ = viewController.view else{
                fatalError("\(viewController) doesn't have any view")
            }
            
            addChildViewController(viewController)
            
            viewController.didMove(toParentViewController: self)
            
        }
    }
    
    func have(viewController:UIViewController) -> Bool {
        return self.childViewControllers.contains(viewController)
    }
}

extension HomeViewController{
    
    func navTitleButtonOnClick(_ sender:UIButton) {
        
        if let home = homeView
        {
            UIView.animate(withDuration: 0.5, animations: {
                home.homeScrollView.contentOffset = CGPoint(x: CGFloat(sender.tag) * ConstScreenSize.screenWidth , y: 0);
            })
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if let home = homeView
        {
            let navTitleLine = home.navTitleLine
            let xRatio: CGFloat = scrollView.contentOffset.x / home.frame.size.width
            
            navTitleLine.transform = CGAffineTransform(translationX: navTitleLine.frame.size.width * xRatio, y: 0)
        }
    }
}
