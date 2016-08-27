//
//  VIPER_Interactor_Server.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

protocol VIPER_Interactor_Server {
    
    func Login(user:VIPER_Entity_User)
    var LoginCompleted:((user:VIPER_Entity_User, error:NSError?)->Void)? {get set}
    
    func ValidateDonate(token:String?, email:String?, price:Double?)
    var ValidateCompleted:((token:String?, email:String?, price:Double?, error:NSError?)->Void)? {get set}
}