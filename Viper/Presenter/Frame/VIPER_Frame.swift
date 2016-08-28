//
//  VIPER_Frame.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation
import UIKit

class VIPER_Frame {
    var storyboardName : String {get {return ""}}
    var storyboardRepresentationID : String {get {return "Main"}}

    var presenter : VIPER_Presenter?
    
    func Setup(wireframe:VIPER_Wireframe) {
        self.SetupPresenter(wireframe)
        self.SetupView()

        self.presenter?.SetupInteractor()
        self.presenter?.SetupConnections()
    }
    
    func SetupPresenter(wireframe:VIPER_Wireframe) {        
    }
    
    func SetupView(storyboard:UIStoryboard? = nil) {
        var curStoryboard : UIStoryboard?
        
        curStoryboard = storyboard
        if curStoryboard == nil {
            curStoryboard = UIStoryboard.init(name: self.storyboardName, bundle: nil)
        }
        
        let view = curStoryboard?.instantiateViewControllerWithIdentifier(self.storyboardRepresentationID) as? VIPER_View
        self.presenter?.view = view
        view?.presenter = self.presenter
    }
}