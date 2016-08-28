//
//  VIPER_Presenter_Main.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

class VIPER_Presenter_Main : VIPER_Presenter {
    
    var viewMain : VIPER_View_Main_IO? {
        get {
            return self.view as? VIPER_View_Main_IO
        }
        set{}
    }
    
    override func SetupConnections() {
        super.SetupConnections()
        
        self.viewMain?.stripePressed = { [unowned self] (Void)->Void in
            self.wireframe?.Push(VIPER_FRAME.Stripe, animated:true)
        }
    }
    
}