//
//  VIPER_View_Login_IO.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

protocol VIPER_View_Login_IO {
    
//MARK: - Input
    var firstName : String? {get set}
    var lastName : String? {get set}
    var email : String? {get set}
    var password : String? {get set}
    
    
//MARK: - Output
    var firstNameChanged:((String?) -> Void)? {get set}
    var lastNameChanged:((String?) -> Void)? {get set}
    var emailChanged:((String?) -> Void)? {get set}
    var passwordChanged:((String?) -> Void)? {get set}
    var loginPressed:(()->Void)? {get set}
}