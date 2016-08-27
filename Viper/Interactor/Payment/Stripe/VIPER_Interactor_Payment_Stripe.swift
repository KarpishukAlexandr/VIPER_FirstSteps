//
//  VIPER_Interactor_Payment_Stripe.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

//
// Test
//  Private:     sk_test_gF9yY1SWRXMD4SSyO1zKHIYE
//  Publishable: pk_test_pEA4pkDtRalyR8u64ivarh6S
//
// Live
//  Secret:      sk_live_twvPlHhFr5THGXWuV3xALibd
//  Publishable: pk_live_SbIPOdlpD7DGzjxYGOj2mkCy
//

class VIPER_Interactor_Payment_Stripe : VIPER_Interactor_Payment {
    
    
    
    init() {
        Setup()
    }

    func Setup () {
#if DEBUG
        Stripe.setDefaultPublishableKey("pk_test_pEA4pkDtRalyR8u64ivarh6S")
#else
        Stripe.setDefaultPublishableKey("pk_live_SbIPOdlpD7DGzjxYGOj2mkCy")
#endif
    }
    
    func CreateToken(card:VIPER_Entity_Card, price:Double) -> Bool {
        let stripCard = STPCard()
        
        stripCard.number = card.cardNumber
        stripCard.cvc = card.cvc
        stripCard.expMonth = card.expirationMonth
        stripCard.expYear = card.expirationYear
        
        do {
            try stripCard.validateCardReturningError()
        } catch _ {
            LOG("Validation failed")
          //  return false
        }

        
        STPAPIClient.sharedClient().createTokenWithCard(stripCard) { (token:STPToken?, error:NSError?) in
            card.token = token?.tokenId
            self.CreateTokenCompleted?(card:card, price:price)
        }
        return true
    }
    
    
//MARK: - VIPER_Interactor_Payment Output
    var CreateTokenCompleted : ((card:VIPER_Entity_Card, price:Double)->Void)?
}