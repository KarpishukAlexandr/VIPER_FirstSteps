//
//  VIPER_Presenter_Main.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

class VIPER_Presenter_Main : VIPER_Presenter {
    
    override func SetupConnections() {
        super.SetupConnections()
        
        var view = self.view as? VIPER_View_Main_IO
        view?.stripePressed = { (Void)->Void in
            self.wireframe?.Push(VIPER_FRAME.Stripe, animated:true)
        }
    }
    
}