//
//  MyView.swift
//  Blog
//
//  Created by Vayne on 2017/8/15.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit
import SnapKit

class MyView: UIView{

    let myViewSize: CGSize = CGSize(width: CGFloat(ConstScreenSize.myViewWidth), height: ConstScreenSize.screenHeight)
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect(origin: CGPoint(x:0,y:0), size: myViewSize))
        
        setUpView()
    }
    
    func setUpView() {
        createButton()
    }
    
    func createButton() {
        let buttonPoint = CGPoint(x: 0, y: ConstScreenSize.statusBarHeight)
        let circleButton = CustomCircleButton(origin: buttonPoint, size: ConstButtonSize.buttonSize, img: nil, bgColor: .gray)
        self.addSubview(circleButton)
    }
    
}
