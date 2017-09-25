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
    
    class func getInstance() -> MyViewButton {
        
        return singleInstance
        
    }
    
    func createButton(with image:UIImage?) -> UIButton {
        
        let button = UIButton(type: UIButtonType.custom)
        
        button.frame = CGRect (origin: ConstButtonSize.buttonOrigin, size: ConstButtonSize.buttonSize)
        
        button.backgroundColor = ConstColor.gray
        
        button.layer.cornerRadius = button.frame.width/2
        
        button.layer.masksToBounds = true
        
        button.contentMode = .scaleAspectFill
        
        button.addTarget(self, action:#selector(MyViewButton.btnOnClick) , for: .touchUpInside)
        
        if let img = image
        {
            
            button.setImage(img, for: UIControlState.normal)
            
            button.adjustsImageWhenHighlighted = false
            
        }else{
            
            let defImage = UIImage(named: "myViewButtonDefault")
            
            button.setImage(defImage, for: UIControlState.normal)
            
        }
        
        return button
        
    }
    
    @objc func btnOnClick() {
       
        SlideOutViewController.getInstance().toggleMyView()
        
    }

}
