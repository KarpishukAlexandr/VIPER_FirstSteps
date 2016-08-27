//
//  VIPER_Entity_Card.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

class VIPER_Entity_Card : VIPER_Entity {
    
    var email : String?
    var cardNumber : String?
    var expirationMonth : UInt = 0
    var expirationYear : UInt = 0
    var cvc : String?
    var token : String?
}

func ==(lhs: VIPER_Entity_Card, rhs: VIPER_Entity_Card) -> Bool
{
    return (lhs.email == rhs.email
        && lhs.cardNumber == rhs.cardNumber
        && lhs.expirationMonth == rhs.expirationMonth
        && lhs.expirationYear == rhs.expirationYear
        && lhs.cvc == rhs.cvc)
}