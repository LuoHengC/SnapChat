//
//  ButtonComponent.swift
//  Blog
//
//  Created by Vayne on 2017/8/2.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

final class MyViewButton: UIButton {
    
    private static let singleInstance = MyViewButton()
    
    static func getInstance() -> MyViewButton {
        
        return singleInstance
        
    }
    
    func createButtonJumpToMyView(for image:UIImage?) -> UIButton {
        
        let button = UIButton(type: UIButtonType.custom)
//        
        button.frame = CGRect (x: 0, y: 0, width: 35, height: 35)
        
        if let img = image
        {
            button.setImage(img, for: UIControlState.normal)
        }else{
            button.setImage(UIImage(named:"myViewButtonDefault"), for: UIControlState.normal)
        }
        
//        button.imageView?.layer.cornerRadius = button.frame.width/2
    
        button.layer.cornerRadius = button.frame.width/2
        
        return button
    }
    
}
