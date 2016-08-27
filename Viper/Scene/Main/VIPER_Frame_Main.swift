//
//  VIPER_Frame_Main.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

class VIPER_Frame_Main : VIPER_Frame {
    
    override var storyboardName : String {get {return "Main"}}

    override func SetupPresenter(wireframe:VIPER_Wireframe) {
        self.presenter = VIPER_Presenter_Main()
        self.presenter?.wireframe = wireframe
    }
}