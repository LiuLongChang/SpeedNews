//
//  SNScrollView.swift
//  SpeedNews
//
//  Created by langyue on 16/5/13.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit



typealias EndScrollToView = (view:UIView)->Void
typealias ScrollToIndex = (index:NSInteger)->Void
typealias ScrollViewDidScroll = (scrollView:UIScrollView)->Void







class SNScrollView: UIView,UIScrollViewDelegate {
    
    
    var endScrollToView : EndScrollToView?
    var scrollToIndex : ScrollToIndex?
    var scrollViewDidScroll : ScrollViewDidScroll?
    
    
    
    var _scrollView : UIScrollView?
    var _arrayOfView : NSMutableArray?
    
    
    private var _currentView : UIView
    var currentView : UIView {
        
        set{
            _currentView = newValue
        }
        
        get{
            
            let currentIndex = (_scrollView?.contentOffset.x)! / (_scrollView?.frame.size.width)!
            var vie : UIView!
            if _arrayOfView?.count > Int(currentIndex) {
                vie = _arrayOfView![Int(currentIndex)] as? UIView
            }else{
                print("%s,数组越界 index: %ld,in %@",#function,currentIndex,self)
            }
            return _currentView
        }
        
    }
    
    
    convenience override init(frame: CGRect) {
        self.init()
        _scrollView = UIScrollView(frame:self.bounds)
        _scrollView?.backgroundColor = UIColor.clearColor()
        _scrollView?.pagingEnabled = true
        _scrollView?.delegate = self
        self.addSubview(_scrollView!)
        _arrayOfView = NSMutableArray()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadView(view:UIView){
        
        view.frame = CGRectMake( CGFloat(_arrayOfView!.count) * _scrollView!.frame.size.width, 0, _scrollView!.frame.size.width, _scrollView!.frame.size.height)
        _scrollView?.addSubview(view)
        _arrayOfView?.addObject(view)
        _scrollView?.contentSize = CGSizeMake(_scrollView!.frame.size.width * CGFloat(_arrayOfView!.count), _scrollView!.frame.size.height)
    }
    
    func deleteViewOfIndex(index:NSInteger){
        
        
        let arrayIndex : NSInteger = index - 1
        if _arrayOfView?.count > arrayIndex {
            
            let view = _arrayOfView![arrayIndex]
            
            //父view移除 删除的View
            view.removeFromSuperview()
            for idx in arrayIndex+1...(_arrayOfView?.count)!-1 {
                let afterView = _arrayOfView![idx] as! UIView
                afterView.frame = CGRectOffset(afterView.frame, -view.frame.size.width, 0)
            }
            //数组里移除View
            _arrayOfView?.removeObjectAtIndex(arrayIndex)
            
            _scrollView?.contentSize = CGSizeMake(_scrollView!.frame.size.width * CGFloat(_arrayOfView!.count), _scrollView!.frame.size.height)
            self.endScroll()
            
        }else{
            print("数组越界index: %ld,in %@,方法： %s, 行号： %d",arrayIndex,self,#function,#line)
        }
        
        
    }
    
    
    
    
    //停止滚动
    func endScroll(){
        
        let currentView = self.currentView
        if self.endScrollToView != nil {
            self.endScrollToView!(view: currentView)
        }
        
        //滑动停止 把当前view是第几个 传出去
        let currentIndex = (_scrollView?.contentOffset.x)! / (_scrollView?.frame.size.width)!
        if self.scrollToIndex != nil {
            self.scrollToIndex!(index: NSInteger(currentIndex + 1))
        }
        
    }
    
    
    //MARK UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (self.scrollViewDidScroll != nil) {
            self.scrollViewDidScroll(scrollView)
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate == false {
            self.endScroll()
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.endScroll()
    }
    
    
    func scrollToViewWithIndex(index:NSInteger){
        let contentOffSetX = CGFloat(index - 1) * (_scrollView?.frame.size.width)!
        _scrollView?.setContentOffset(CGPointMake(contentOffSetX, 0), animated: true)
        self.endScroll()
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
