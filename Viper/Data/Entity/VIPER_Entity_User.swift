//
//  User_Entity.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

let INVALID_USER_ID : Int64 = -1

class VIPER_Entity_User : VIPER_Entity {

    var id : Int64! = INVALID_USER_ID
    var firstName : String?
    var lastName : String?
    var email : String?
    var lastVisitTime : NSDate?
}


//MARK: - Equatable

func ==(lhs: VIPER_Entity_User, rhs: VIPER_Entity_User) -> Bool
{
    return (lhs.id == rhs.id
        && lhs.firstName == rhs.firstName
        && lhs.lastName == rhs.lastName)
}
