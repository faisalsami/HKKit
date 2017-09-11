//
//  HKViewTab.swift
//  Genemedics
//
//  Created by Hardik Shah on 03/09/17.
//  Copyright © 2017 Praxinfo. All rights reserved.
//

import UIKit
import Cartography

public class HKViewTab:HKCardView {
    
    
    fileprivate weak var selectedView:WeekView?
    let containerView:UIView = {
        
        let containerView = UIView()
        return containerView
    
    } ()
    
    
    let stackView:UIStackView = {
    
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 1
        stackview.distribution = .fillEqually
        stackview.alignment = .fill
        return stackview
    } ()

    
    open var data: [ViewPager]! {
        didSet {
            self.cleanUp()
            self.setUp()
            self.constraintSetup()
        }
        
    }
    
    
    var onSelect:((ViewPager)->())?
    
    convenience init() {
        self.init(frame:.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
 
    func cleanUp() {
        
        self.stackView.subviews.forEach({$0.removeFromSuperview()})
        selectedView = nil
        
    }
    
    func constraintSetup() {
        
        constrain(containerView) { (view) in
            view.width == view.superview!.width
            view.top == view.superview!.top
            view.bottom == view.superview!.bottom
            view.centerY == view.superview!.centerY
            
        }
        
        
        
        constrain(stackView) { (view) in
            view.width == view.superview!.width
            view.height == view.superview!.height
            view.center == view.superview!.center
        }
        
    }
    
    func setUp() {
        self.isShadowVisible = false
        addSubview(containerView)
        containerView.addSubview(stackView)
        for (index,obj) in data.enumerated() {
            let weekView = WeekView(obj: obj)
            if index == 0 {
                weekView.isSelected = true
                selectedView = weekView
            }
            
            weekView.onSelect = { view in
                
                self.onSelect?(view.obj)
                guard let previousView = self.selectedView else {
                    return
                }
                
                previousView.isSelected = !previousView.isSelected
                self.selectedView = view
                
            
            }
            stackView.addArrangedSubview(weekView)
        }

    }
    
    
 
    
   
    
    
    
  
}

fileprivate class WeekView:UIView {
    
    let lbl = UILabel()
    var onSelect:((WeekView)->())?
    var obj:ViewPager!
    
    var isSelected:Bool = false {
        
        didSet{
            self.backgroundColor = isSelected ? .clear : .white
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    convenience init(obj:ViewPager) {
        self.init(frame: CGRect.zero)
        self.obj = obj
        lbl.textAlignment = .center
        lbl.textColor = MAIN_COLOR
        lbl.text = obj.title
        lbl.font = UIFont.systemFont(ofSize: 11, weight: UIFontWeightMedium)
        
        constraintSetup()
        gestureSetup()
        
    }
    func constraintSetup(){
        self.isUserInteractionEnabled = true
        self.addSubview(lbl)
        self.backgroundColor = .white
        constrain(lbl) { (view) in
            view.width == view.superview!.width
            view.height == view.superview!.height
            view.center == view.superview!.center
            
            
        }
        
        
    }
    
    func gestureSetup(){
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.onClick))
        self.addGestureRecognizer(gesture)
    }
    
    func onClick(){
        
        self.isSelected = !self.isSelected
        onSelect?(self)
        
    }
    
    
}




