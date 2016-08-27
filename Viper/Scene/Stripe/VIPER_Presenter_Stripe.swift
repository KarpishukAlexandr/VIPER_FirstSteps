//
//  VIPER_Presenter_Stripe.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

class VIPER_Presenter_Stripe : VIPER_Presenter {
    
    internal let VALIDATION_COMLETED_MESSAGE_ID = 1000
    internal let VALIDATION_INVALID_DATA_MESSAGE_ID = 1001
    
    var interactorPayment : VIPER_Interactor_Payment?
    var interactorServer  : VIPER_Interactor_Server?
    
    override func SetupInteractor() {
        self.interactorPayment = self.wireframe?.interactorPayment
        self.interactorServer = self.wireframe?.interactorServer
    }
    
    override func SetupConnections() {
        super.SetupConnections()

        var view = self.view as? VIPER_View_Stripe_IO

//MARK: - Setup View
        view?.donatePressed = {
            let card : VIPER_Entity_Card = VIPER_Entity_Card()
            card.email = view?.email
            card.cardNumber = view?.cardNumber
            card.cvc = view?.cvc
            let expirationDate = view?.cardExpirationDate?.componentsSeparatedByString("/")
            if (expirationDate?.count == 2) {
                card.expirationMonth = UInt(NSString(string:expirationDate![0]).integerValue)
                card.expirationYear  = UInt(NSString(string:expirationDate![1]).integerValue)
            }
            let price = NSString(string:(view?.price)!).doubleValue
            
            if (self.interactorPayment?.CreateToken(card, price:price) == false) {
                view?.ShowMessage("Invalid entered data", ID: self.VALIDATION_INVALID_DATA_MESSAGE_ID)
            }
        }
        
        view?.messageDidHide = { (ID:Int)->Void in
            if (ID == self.VALIDATION_COMLETED_MESSAGE_ID) {
                self.wireframe?.Pop(true)
            }
        }
        
//MARK: - Setup Interactors
        self.interactorPayment?.CreateTokenCompleted = { (card:VIPER_Entity_Card, price:Double)->Void in
            let price = NSString(string:(view?.price)!).doubleValue
            self.interactorServer?.ValidateDonate(card.token, email:view?.email, price: price)
        }
        
        self.interactorServer?.ValidateCompleted = { (token:String?, email:String?, price:Double?, error:NSError?) -> Void in
            if (error == nil) {
                LOG("Transaction completed:\nToken: '\(token)'")
            } else {
                LOG("Transaction completed:\nError: '\(error!)'")
            }
            view?.ShowMessage("Transaction Completed!", ID: self.VALIDATION_COMLETED_MESSAGE_ID)
        }
    }
    
}

extension VIPER_Presenter_Stripe : VIPER_Presenter_Stripe_IO {
    
}