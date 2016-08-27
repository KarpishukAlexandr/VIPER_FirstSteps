//
//  VIPER_Interactor_Payment.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

protocol VIPER_Interactor_Payment : VIPER_Interactor{
    
    func CreateToken(card:VIPER_Entity_Card, price:Double) -> Bool
    
    var CreateTokenCompleted : ((card:VIPER_Entity_Card, price:Double)->Void)? {get set}
}