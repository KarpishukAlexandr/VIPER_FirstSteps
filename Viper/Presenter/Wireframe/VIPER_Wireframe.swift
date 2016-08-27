//
//  VIPER_Wireframe.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation
import UIKit

enum VIPER_FRAME : Int {
    case Login
    case Main
    case Stripe
}

protocol VIPER_Wireframe {
    var storyboard : UIStoryboard? {get set}
    var navigationVC : UINavigationController? {get set}
    
    var interactorPayment : VIPER_Interactor_Payment? {get}
    var interactorServer : VIPER_Interactor_Server? {get}
    
    func SwitchTo(frame:VIPER_FRAME) -> Bool
    
    func Push(view:VIPER_View!, animated:Bool)
    func Push(frame:VIPER_FRAME, animated:Bool)
    func Pop(animated:Bool)
    func Replace(view:VIPER_View!, animated:Bool)
    func Replace(frame:VIPER_FRAME, animated:Bool)
}