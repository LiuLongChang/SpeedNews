//
//  LaunchADView.swift
//  SpeedNews
//
//  Created by langyue on 16/5/13.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit



typealias EndShowBlock = Void->Void
typealias TapAdViewBlock = Void->Void




class LaunchADView: UIImageView {
    
    
    
    var endShowBlock : EndShowBlock?
    var tapAdViewBlock : TapAdViewBlock?
    var adImageView : UIImageView?
    
    
    convenience init(frame: CGRect,imgPhone4_5_6_6PNames array:NSArray,ADImgName imgName:String) {
    
        self.init(frame:frame)
        
        self.userInteractionEnabled = true
        
        self.backgroundColor = UIColor.clearColor()
        let index = iPhone4_5_6_6P_LaunchADView(0, b: 1, c: 2, d: 3)
        var backImgName = ""
        if array.count > index {
            backImgName = array[index] as! String
        }else if (array.count > 0){
            backImgName = array[0] as! String
        }
        self.image = UIImage(named: backImgName)
        
        
        
        adImageView = UIImageView(frame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * ADViewHeightScale))
        adImageView?.image = UIImage(named: imgName)
        adImageView?.contentMode = .ScaleAspectFill
        adImageView?.backgroundColor = UIColor.clearColor()
    
        
        adImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(LaunchADView.tapAdViewAction(_:))))
        
        adImageView?.userInteractionEnabled = true
        self.addSubview(adImageView!)
        
    }
    
    
    func tapAdViewAction(tap:UITapGestureRecognizer){
        if (self.tapAdViewBlock != nil) {
            self.tapAdViewBlock!()
        }
    }
    
    
    class func createADViewWithImagePhone4_5_6_6PNames(array:NSArray,ADImageName imgName:String)->LaunchADView{
        let window  = ((UIApplication.sharedApplication().delegate?.window)!)!
        let view = LaunchADView(frame:window.bounds,imgPhone4_5_6_6PNames: array,ADImgName: imgName)
        view.backgroundColor = UIColor.whiteColor()
        window.addSubview(view)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(ADViewShowDuration)*NSEC_PER_SEC)), dispatch_get_main_queue()) {
            view.removeFromSuperview()
            if view.endShowBlock != nil {
                view.endShowBlock!()
            }
        }
        return view
    }
    
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
