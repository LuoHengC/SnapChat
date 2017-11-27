//
//  CustomScrollView.swift
//  Blog
//
//  Created by Vayne on 2017/11/27.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class CustomScrollView: UIScrollView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame:CGRect)
    {
        super.init(frame: frame)
        
        isPagingEnabled = true
        isDirectionalLockEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        scrollsToTop = false
        bounces = false
        translatesAutoresizingMaskIntoConstraints = false
        self.frame = frame
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer.isKind(of: UIPanGestureRecognizer.self)
        {
            if  let panGesture = gestureRecognizer as? UIPanGestureRecognizer
            {
                if panGesture.translation(in: self).x > 0 && self.contentOffset.x == 0
                {
                    return false
                }
            }
        }
        return true
    }

}
