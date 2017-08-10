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
    
    func createButton(for image:UIImage?) -> UIButton {
        
        let button = UIButton(type: UIButtonType.custom)
        
        button.frame = CGRect (origin: ConstSize.buttonOrigin, size: ConstSize.buttonSize)
        
        button.backgroundColor = ConstColor.blue
        
        button.layer.cornerRadius = button.frame.width/2
        
        button.layer.masksToBounds = true
        
        if let img = image
        {
            
            button.setImage(img, for: UIControlState.normal)
            
        }else{
            
            button.setImage(UIImage(named:"myViewButtonDefault"), for: UIControlState.normal)
            
            
            
            button.imageView?.image?.resizableImage(withCapInsets: UIEdgeInsetsMake(5, 5, 5, 5), resizingMode: UIImageResizingMode.stretch)
            
        }
        
        return button
        
    }
    
}
