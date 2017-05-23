//
//  UIButton+Extension.swift
//  HKCustomization
//
//  Created by Hardik on 10/18/15.
//  Copyright © 2015 . All rights reserved.
//

import UIKit

extension UIButton{
    public func setAppBackGroundColor()->Void{
        self.backgroundColor = MAIN_COLOR
    }
    public func setAppDisableColor()->Void{
        self.backgroundColor = UIColor.lightGray
    }
    
    public func toggleOnOff()->Void{
        self.isSelected = !self.isSelected;
    }
    public func setDisableWithAlpha(_ isDisable:Bool){
        if isDisable {
            self.isEnabled = false
            self.alpha = 0.5
        }else{
            self.isEnabled = true
            self.alpha = 1.0
        }
    }
    func appleBootStrapTheme(_ color:UIColor = MAIN_COLOR){
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 2
        self.layer.borderColor = color.cgColor
        self.setTitleColor(color, for: UIControlState())
    }
    
    func setAttributeString(_ mainString:String,attributeString:String,attributes:[String:Any]){
        
        let range = mainString.range(of: attributeString, options: NSString.CompareOptions.caseInsensitive)
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string:mainString)
        
        if range != nil {
            
            attrString.addAttributes(attributes, range: NSMakeRange((mainString.characters.distance(from: mainString.startIndex, to: range!.lowerBound)),attributeString.characters.count))
            self.setAttributedTitle(attrString, for: UIControlState())
            
        }else{
            self.setTitle(mainString, for: UIControlState())
            
        }
        
    }

}
