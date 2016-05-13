//
//  ConfigSetting.swift
//  SpeedNews
//
//  Created by langyue on 16/5/13.
//  Copyright © 2016年 langyue. All rights reserved.
//

import Foundation
import UIKit




func iPhone4_5_6_6P_LaunchADView(a:CGFloat,b:CGFloat,c:CGFloat,d:CGFloat) -> Int {
    if CGSizeEqualToSize(CGSizeMake(320, 480), UIScreen.mainScreen().bounds.size) {
        return Int(a)
    }else if (CGSizeEqualToSize(CGSizeMake(320, 568), UIScreen.mainScreen().bounds.size)) {
        return Int(b)
    }else if (CGSizeEqualToSize(CGSizeMake(375, 667), UIScreen.mainScreen().bounds.size)) {
        return Int(c)
    }else if (CGSizeEqualToSize(CGSizeMake(414, 736), UIScreen.mainScreen().bounds.size)) {
        return Int(d)
    }
    return 0
}

//广告图 和 屏幕 高度的 比例
let ADViewHeightScale : CGFloat = 0.78
let ADViewShowDuration : CGFloat = 4.0






func XFrom6(x:CGFloat)->CGFloat{
    return UIScreen.mainScreen().bounds.size.width / 375.0 * x
}

func YFrom6(y:CGFloat)->CGFloat{
    return UIScreen.mainScreen().bounds.size.height / 667.0 * y
}


func RGB(r: CGFloat,g: CGFloat,b: CGFloat)->UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->UIColor{
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}










