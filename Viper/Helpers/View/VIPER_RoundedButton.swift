//
//  VIPER_RoundedButton.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation
import UIKit

class VIPER_RoundedButton : UIButton {
    internal var p_borderColor : UIColor? = nil
    var borderColor : UIColor? {
        get {
            return self.p_borderColor
        }
        
        set {
            self.p_borderColor = newValue
            
            if self.superview != nil {
                self.applyBorderColor()
            }
        }
    }
    var borderWidth : CGFloat = 1.0
    var cornerRadius : CGFloat = 5.0
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        
        super.willMoveToSuperview(newSuperview)
        
        if newSuperview != nil {
            self.applyBorderColor()
        
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    private func applyBorderColor() {
        if self.borderColor != nil {
            self.layer.borderColor = self.borderColor?.CGColor
            self.layer.borderWidth = self.borderWidth
        } else {
            self.layer.borderColor = self.borderColor?.CGColor
            self.layer.borderWidth = 0.0
        }
    }
}