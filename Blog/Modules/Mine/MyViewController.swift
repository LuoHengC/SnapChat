//
//  MyViewController.swift
//  Blog
//
//  Created by Vayne on 2017/8/15.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MyViewController {

    private let myViewScale:CGFloat = 0.75
    
    func getFrame() -> CGRect {
        return CGRect(x: -ConstScreenSize.screenWidth * (1 - myViewScale), y: 0, width: ConstScreenSize.screenWidth, height: ConstScreenSize.screenHeight)
    }

}
