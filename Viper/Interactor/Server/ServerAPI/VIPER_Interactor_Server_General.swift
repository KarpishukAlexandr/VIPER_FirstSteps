//
//  VIPER_Interactor_Server_General.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

class VIPER_Interactor_Server_General {
    
    
//MARK: - VIPER_Interactor_Server
    var LoginCompleted:((user:VIPER_Entity_User, error:NSError?)->Void)?
    var ValidateCompleted:((token:String?, email:String?, price:Double?, error:NSError?)->Void)?
}

//MARK: - VIPER_Interactor_Server
extension VIPER_Interactor_Server_General : VIPER_Interactor_Server {
//MARK: - Input
    func Login(user:VIPER_Entity_User) {
        //Server request
        
        //Request Completed
        self.LoginCompleted?(user: user, error:nil)
    }
    
    func ValidateDonate(token:String?, email:String?, price:Double?) {
        //Server request
        
        //Request Completed
        self.ValidateCompleted?(token:token, email:email, price:price, error:nil)
    }

    
//MARK: - Output
}