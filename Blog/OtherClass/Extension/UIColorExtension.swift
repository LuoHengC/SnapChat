//
//  UIcolorExtension.swift
//  Blog
//
//  Created by Vayne on 2017/8/10.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

extension UIColor{

    convenience init(rgb:UInt){
        
        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
                  alpha: 1.0
        )
        
    }

}
