//
//  Const.swift
//  Blog
//
//  Created by Vayne on 2017/8/3.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

//存放的常量颜色
struct ConstColor {
    static let red = UIColor(rgb:0xEC0037)
    static let blue = UIColor(rgb:0x009DF6)
    static let gray = UIColor(rgb:0xCAD6DE)
    static let darkGray = UIColor(rgb:0x758996)
    static let lightGray = UIColor(rgb:0x9F9F9F)
    static let yellow = UIColor(rgb: 0xFFDE2C)
    static let clear = UIColor.clear
    static let white = UIColor.white
}

//存放自定义button的大小固定值
struct ConstButtonSize {
    static let buttonOriginZero = CGPoint(x: 0, y: 0) //初始化的button的originSize
    static let buttonSize = CGSize(width: 35, height: 35) //一般的按钮大小
    static let navTitleButtonSize = CGSize(width: 45, height: 35) //导航栏按钮的大小
}

//存放屏幕的大小
struct ConstScreenSize{
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

//存放常量字体大小
struct ConstFontSize {
    static let fontSize : CGFloat = 14.0
}



