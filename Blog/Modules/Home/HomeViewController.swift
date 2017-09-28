//
//  HomeViewController.swift
//  Blog
//
//  Created by Vayne on 2017/7/25.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

struct ApplicationControlsSize {
    
    static fileprivate(set) var navigationHeight:CGFloat?
    static fileprivate(set) var tabBarHeight:CGFloat?
    static fileprivate(set) var statusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.height
    
}

class HomeViewController :UIViewController  {
    
    let viewControllers:[UIViewController]
    
    init(){
        
        viewControllers = [HomePageViewController() , LiveViewController()]
        
        super.init(nibName: nil, bundle: nil)
        
        setUp()
        
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        
        self.init()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ApplicationControlsSize.navigationHeight = self.navigationController?.navigationBar.frame.height
        ApplicationControlsSize.tabBarHeight = self.tabBarController?.tabBar.frame.height
        
        if let navHeight = ApplicationControlsSize.navigationHeight , let tabHeight = ApplicationControlsSize.tabBarHeight {
            
            let homeView = HomeView(viewControllers: viewControllers, topHeight: navHeight + ApplicationControlsSize.statusBarHeight, tabBarHeight: tabHeight)
            
            self.view.addSubview(homeView)

        }
        
    }
    
}

extension HomeViewController{
    
    func setUp() {
        
        let tabBarItem = TabBarConfig.setTabBarItem(title:"主页",image: UIImage(named:"tabBar_home.png"),selectImage: UIImage(named: "tabBar_home_highLight.png"))
        
        self.tabBarItem = tabBarItem
        
        NavigationItemConfig.setNavigationLeftButton(navigationItem: self.navigationItem)
        
    }
    
//    func have(viewController:UIViewController) -> Bool {
//
//        return self.childViewControllers.contains(viewController)
//
//    }
//
//    func setUpViewController() {
//
//        for viewController in viewControllers {
//
//            if have(viewController: viewController){
//               continue
//            }
//
//            guard let pageView = viewController.view else{
//                 fatalError("\(viewController) doesn't have any view")
//            }
//
//            pageView.frame = .zero
//            pageView.translatesAutoresizingMaskIntoConstraints = false
//
//
//        }
//
//    }
    
    
}
