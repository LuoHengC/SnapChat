//
//  MyViewController.swift
//  Blog
//
//  Created by Vayne on 2017/8/15.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MyViewController :UIViewController {

    let myView = MyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myView)
    }

}
