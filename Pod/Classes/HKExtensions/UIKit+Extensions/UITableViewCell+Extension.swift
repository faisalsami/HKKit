//
//  UIImage+Extension.swift
//  HKCustomization
//
//  Created by Hardik on 10/18/15.
//  Copyright © 2015 . All rights reserved.
//

import UIKit
extension UITableViewCell {
   public func removeAllGestures(){
        if let recognizers = self.contentView.gestureRecognizers
        {
            for recognizer in recognizers {
                self.contentView.removeGestureRecognizer(recognizer )
            }
        }
    }
    
    
}
extension UITableViewCell {
    
    func setSepratorInsetZero(){
        self.layoutMargins = UIEdgeInsetsZero
        self.preservesSuperviewLayoutMargins = false
        
    }
}
