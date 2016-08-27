//
//  VIPER_View_Stripe.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation
import UIKit

class VIPER_View_Stripe : VIPER_View {
    
    @IBOutlet var fieldEmail : UITextField?
    @IBOutlet var fieldCardNumber : UITextField?
    @IBOutlet var fieldCardExpirationDate : UITextField?
    @IBOutlet var fieldCVC : UITextField?
    @IBOutlet var fieldPrice : UITextField?
    @IBOutlet var btnDonate : VIPER_RoundedButton?
    
    
    @IBAction func emailEndEditing(sender:AnyObject?) {
        self.emailChanged?(self.email)
        
        self.fieldEmail?.resignFirstResponder()
        self.fieldCardNumber?.becomeFirstResponder()
    }
    
    @IBAction func cardNumberEndEditing(sender:AnyObject?) {
        self.cardNumberChanged?(self.cardNumber)
        
        self.fieldCardNumber?.resignFirstResponder()
        self.fieldCardExpirationDate?.becomeFirstResponder()
    }
    
    @IBAction func cardExpirationDateEndEditing(sender:AnyObject?) {
        self.cardExpirationDateChanged?(self.cardExpirationDate)
        
        self.fieldCardExpirationDate?.resignFirstResponder()
        self.fieldCVC?.becomeFirstResponder()
    }
    
    @IBAction func CVCEndEditing(sender:AnyObject?) {
        self.cvcChanged?(self.cvc)
        
        self.fieldCVC?.resignFirstResponder()
        self.fieldPrice?.becomeFirstResponder()
    }
    
    @IBAction func priceEndEditing(sender:AnyObject?) {
        self.priceChanged?(self.price)
        
        self.fieldPrice?.resignFirstResponder()
        self.donatePressed?()
    }
    
    @IBAction func donateTouchUpInside(sender:AnyObject?) {
        self.donatePressed?()
    }
    
//MARK: VIPER_FRAME_Login_IO Output
    var emailChanged : ((String?) -> Void)?
    var cardNumberChanged : ((String?) -> Void)?
    var cardExpirationDateChanged : ((String?) -> Void)?
    var cvcChanged : ((String?) -> Void)?
    var priceChanged : ((String?) -> Void)?
    
    var donatePressed:(()->Void)?
    var messageDidHide:((ID:Int)->Void)?
}

//MARK: -
extension VIPER_View_Stripe : VIPER_View_Stripe_IO {
    
    //MARK: - Input
    var email : String? {
        get {
            return self.fieldEmail?.text
        }
        set {
            self.fieldEmail?.text = newValue
        }
    }
    var cardNumber : String? {
        get {
            return self.fieldCardNumber?.text
        }
        set {
            self.fieldCardNumber?.text = newValue
        }
    }
    var cardExpirationDate : String? {
        get {
            return self.fieldCardExpirationDate?.text
        }
        set {
            self.fieldCardExpirationDate?.text = newValue
        }
    }
    var cvc : String? {
        get {
            return self.fieldCVC?.text
        }
        set {
            self.fieldCVC?.text = newValue
        }
    }
    var price : String? {
        get {
            return self.fieldPrice?.text
        }
        set {
            self.fieldPrice?.text = newValue
        }
    }
    
    func ShowMessage(message:String?, ID:Int) {
        let alert = UIAlertView(title:"Message", message:message, delegate:self, cancelButtonTitle:"OK")
        alert.tag = ID
        alert.show()
    }
    
    //MARK: - Output
    
}

extension VIPER_View_Stripe : UIAlertViewDelegate {
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        self.messageDidHide?(ID: alertView.tag)
    }
    
}
