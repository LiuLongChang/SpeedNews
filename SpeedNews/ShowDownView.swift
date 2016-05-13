//
//  ShowDownView.swift
//  SpeedNews
//
//  Created by langyue on 16/5/13.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit


enum DeleteButtonStatus : Int {
    case Normal = 0,NeverDelete,CanDelete
    
}

class DeleteButton: UIButton {
    
    private var _deleteStatus : DeleteButtonStatus?
    var deleteStatus : DeleteButtonStatus? {
        
        set{
            
            if _deleteStatus == DeleteButtonStatus.NeverDelete {
                return
            }
            
            
            switch newValue {
            case .Normal:
                {
                    self.smallDeleteButton?.hidden = true
                }
            case .NeverDelete:
                {
                    self.smallDeleteButton?.hidden = true
                }
            case .CanDelete:
                {
                    self.smallDeleteButton?.hidden = true
                }
                
            default:
                break
            }
            
            _deleteStatus = newValue
            
        }
        get{
            return _deleteStatus
        }
    }
    
    private var _smallDeleteButton : UIButton?
    var smallDeleteButton : UIButton? {
        
        set{
            _smallDeleteButton = newValue
        }
        get{
            
            if _smallDeleteButton == nil {
                _smallDeleteButton = UIButton(type:.Custom)
                _smallDeleteButton?.frame = CGRectMake(self.frame.size.width - 13, -6, 19, 19)
                _smallDeleteButton?.setImage(UIImage(named: "close"), forState: .Normal)
                self.addSubview(_smallDeleteButton!)
            }
            return _smallDeleteButton
            
        }
        
    }
    
    
    
    
    
    
    
    
    
}






typealias ClickedButtonIndex = (index:NSInteger)->Void
typealias ClickedDeleteButtonIndex = (index:NSInteger)->Void
typealias ClickedAddButtonIndex = (index:NSInteger)->Void



class ShowDownView: UIView {

    
    
    var _originFrame : CGRect?
    var _originY : CGFloat?
    var _scrollView : UIScrollView?
    var _showingArray : NSMutableArray?
    var _canAddArray : NSMutableArray?
    var _buttonWidth : CGFloat?
    var _buttonHeight : CGFloat?
    var _leading : CGFloat?
    var _horSpacing : CGFloat?
    var _verSpacing : CGFloat?
    var addLabel: UILabel?
    var _isDeleting : Bool?
    var _upBeginY : CGFloat?
    var _downBeginY : CGFloat?
    var _canAddMaxSumNum : NSInteger?
    
    
    
    var isAnimating : Bool?
    
    private var _showFrame : CGRect?
    var showFrame : CGRect? {
        
        set{
           _showFrame = newValue
            if _originY == nil {_originY = 0}
            _scrollView?.frame = CGRectMake(0, _originY!, self.frame.size.width, self.showFrame!.size.height - _originY!)
        }
        get{
            return _showFrame
        }
    }
    
    var clickedButtonIndex : ClickedButtonIndex?
    var clickedDeleteButtonIndex : ClickedDeleteButtonIndex?
    var clickedAddButtonIndex : ClickedAddButtonIndex?
    
    
    
    
    
    
    
    
    
    
    convenience override init(frame: CGRect) {
        self.init()
        //最多可显示24个分类
        _canAddMaxSumNum = 24
        //初始化 非 删除状态
        _isDeleting = false
        
        
        _showingArray = NSMutableArray()
        _canAddArray = NSMutableArray()
        
        //记录 初始的Frame
        _originFrame = frame
        //初始化 各种变量
        _buttonWidth = XFrom6(74.0)
        _buttonHeight = XFrom6(34.0)
        _leading = XFrom6(15.0)
        _horSpacing = (self.frame.size.width - 4*_buttonWidth! - _leading!*2) / 3.0
        _verSpacing = XFrom6(15.0)
        
        _upBeginY = _verSpacing
        
    }
    
    func hide(){
        
        self.isAnimating = true
        UIView.animateWithDuration(0.3, animations: {
            self.frame = self._originFrame!
        }) { (finish:Bool) in
            self.isAnimating = false
        }
        
    }
    
    
    
    
    func show(){
        
        if _isDeleting == true {
            self.showDeleteStatus(nil)
        }
        
        self.isAnimating = true
        
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 1.0
            self.frame = self.showFrame!
        }) { (finished:Bool) in
            self.isAnimating = false
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    func showDeleteStatus(btn:UIButton?) -> Void {
        
        
        if _isDeleting == true {
            _isDeleting = false
            //进入非删除状态
            
            
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
