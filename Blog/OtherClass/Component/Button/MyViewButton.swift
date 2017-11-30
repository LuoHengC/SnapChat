//
//  ButtonComponent.swift
//  Blog
//
//  Created by Vayne on 2017/8/2.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class MyViewButton: UIButton {
    
    private static let singleInstance = MyViewButton()
    
    class func getInstance() -> MyViewButton {
        
        return singleInstance
        
    }
    
    func createButton(with image:UIImage?) -> UIButton {
        
        let button = CustomCircleButton(origin: ConstButtonSize.buttonOriginZero, size: ConstButtonSize.buttonSize, img: image, bgColor: ConstColor.gray).getCircleButton()
        
        button.addTarget(self, action:#selector(MyViewButton.btnOnClick) , for: .touchUpInside)
        
        return button
    }
    
    @objc func btnOnClick() {
        SlideOutViewController.getInstance().toggleMyView()
    }

}
