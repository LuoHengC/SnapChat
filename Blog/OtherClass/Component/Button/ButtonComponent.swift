//
//  ButtonComponent.swift
//  Blog
//
//  Created by Vayne on 2017/8/2.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class ButtonComponent: UIButton {
    
    class func createButtonJumpToMyView(for image:UIImage?) -> UIButton {
        
        let button = UIButton(type: UIButtonType.custom)
        
        button.frame = CGRect (x: 0, y: 0, width: 34, height: 34)
        
        if let img = image
        {
            button.setImage(img, for: UIControlState.normal)
        }else{
            button.backgroundColor = UIColor.gray
        }
        
        button.imageView?.layer.cornerRadius = button.frame.width/2
    
        button.layer.cornerRadius = button.frame.width/2
        
        return button
    }
    
}
