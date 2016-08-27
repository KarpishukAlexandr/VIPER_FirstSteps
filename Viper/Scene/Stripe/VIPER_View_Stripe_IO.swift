//
//  VIPER_View_Stripe_IO.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

protocol VIPER_View_Stripe_IO {
    
//MARK: - Input
    var email : String? {get set}
    var cardNumber : String? {get set}
    var cardExpirationDate : String? {get set}
    var cvc : String? {get set}
    var price : String? {get set}
    
    func ShowMessage(message:String?, ID:Int)
    
    
//MARK: - Output
    var emailChanged : ((String?) -> Void)? {get set}
    var cardNumberChanged : ((String?) -> Void)? {get set}
    var cardExpirationDateChanged : ((String?) -> Void)? {get set}
    var cvcChanged : ((String?) -> Void)? {get set}
    var priceChanged : ((String?) -> Void)? {get set}
    
    var donatePressed:(()->Void)? {get set}
    var messageDidHide:((ID:Int)->Void)? {get set}
}