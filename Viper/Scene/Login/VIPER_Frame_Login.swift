//
//  VIPER_Frame_Login.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation
import UIKit

class VIPER_Frame_Login : VIPER_Frame {
    
    override var storyboardName : String {get {return "Login"}}
   
    override func SetupPresenter(wireframe:VIPER_Wireframe) {
        self.presenter = VIPER_Presenter_Login()
        self.presenter?.wireframe = wireframe
    }
}



