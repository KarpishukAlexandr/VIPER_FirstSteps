//
//  VIPER_View_Login.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation
import UIKit

class VIPER_View_Login : VIPER_View {
    
    @IBOutlet var fieldFirstName : UITextField?
    @IBOutlet var fieldLastName : UITextField?
    @IBOutlet var fieldEmail : UITextField?
    @IBOutlet var fieldPassword : UITextField?
    @IBOutlet var btnLogin : UIButton?
    
    
    
    @IBAction func firstNameEndEditing(sender:AnyObject?) {
        self.firstNameChanged?(self.firstName)
        
        self.fieldFirstName?.resignFirstResponder()
        self.fieldLastName?.becomeFirstResponder()
    }
    
    @IBAction func lastNameEndEditing(sender:AnyObject?) {
        self.lastNameChanged?(self.lastName)
        
        self.fieldLastName?.resignFirstResponder()
        self.fieldEmail?.becomeFirstResponder()
    }
    
    @IBAction func emailEndEditing(sender:AnyObject?) {
        self.emailChanged?(self.email)
        
        self.fieldEmail?.resignFirstResponder()
        self.fieldPassword?.becomeFirstResponder()
    }
    
    @IBAction func passwordEndEditing(sender:AnyObject?) {
        self.passwordChanged?(self.password)
        
        self.fieldPassword?.resignFirstResponder()
        self.loginPressed?()
    }

    @IBAction func loginTouchUpInside(sender:AnyObject?) { 
        self.loginPressed?()
    }
    
//MARK: VIPER_FRAME_Login_IO Output
    var firstNameChanged:((String?) -> Void)?
    var lastNameChanged:((String?) -> Void)?
    var emailChanged:((String?) -> Void)?
    var passwordChanged:((String?) -> Void)?
    var loginPressed:(()->Void)?
    
}

//MARK: - VIPER_View_Login_IO
extension VIPER_View_Login : VIPER_View_Login_IO {
    
//MARK: Input
    var firstName : String? {
        get {
            return self.fieldFirstName?.text
        }
        set {
            self.fieldFirstName?.text = newValue
        }
    }
    
    var lastName : String? {
        get {
            return self.fieldLastName?.text
        }
        
        set {
            self.fieldLastName?.text = newValue
        }
    }
    
    var email : String? {
        get {
            return self.fieldEmail?.text
        }
        
        set {
            self.fieldEmail?.text = newValue
        }
    }
    
    var password : String? {
        get {
            return self.fieldPassword?.text
        }
        
        set {
            self.fieldPassword?.text = newValue
        }
    }
    
    
//MARK: Output
}