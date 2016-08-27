//
//  VIPER_View_Main.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation
import UIKit

class VIPER_View_Main : VIPER_View {
    
    @IBOutlet var labelTitle : UILabel?
    @IBOutlet var btnStripe : VIPER_RoundedButton?
    
    
    @IBAction func stripeTochUpInside(sender:AnyObject?) {
        self.stripePressed?()
    }
    
//MARK: VIPER_View_Main_IO Output
    var stripePressed:(()->Void)?

}

//MARK: - VIPER_View_Main_IO
extension VIPER_View_Main : VIPER_View_Main_IO {
//MARK: Input
//MARK: Output
}