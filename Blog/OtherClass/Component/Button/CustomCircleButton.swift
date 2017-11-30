//
//  CustomButton.swift
//  Blog
//
//  Created by Vayne on 2017/11/28.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class CustomCircleButton: UIButton {
    
    let customCirclebutton = UIButton(type: .custom)
    let buttonOrigin:CGPoint
    let buttonSize:CGSize
    var buttonImage:UIImage?
    let buttonBackgroundColor:UIColor
    
    init(origin:CGPoint , size:CGSize , img:UIImage? , bgColor:UIColor) {
        
        buttonOrigin = origin
        buttonSize = size
        buttonBackgroundColor = bgColor
        
        super.init(frame: .zero)
        
        buttonImage = img
        
        createCircleButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCircleButton(){
        
        customCirclebutton.frame = CGRect (origin: buttonOrigin, size: buttonSize)
        customCirclebutton.backgroundColor = buttonBackgroundColor
        customCirclebutton.layer.cornerRadius = customCirclebutton.frame.width/2
        customCirclebutton.layer.masksToBounds = true
        customCirclebutton.contentMode = .scaleAspectFill
        
        if let img = buttonImage
        {
            customCirclebutton.setImage(img, for: UIControlState.normal)
            customCirclebutton.adjustsImageWhenHighlighted = false
        }
        else
        {
            let defImage = UIImage(named: "myViewButtonDefault")
            customCirclebutton.setImage(defImage, for: UIControlState.normal)
            
        }
    }
    
    func getCircleButton() -> UIButton {
        return customCirclebutton
    }
    
}
