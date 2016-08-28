//
//  VIPER_Presenter.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

class VIPER_Presenter {
    weak var view : VIPER_View?
    var wireframe : VIPER_Wireframe?
    
    
    func SetupInteractor() {

    }
    
    func SetupConnections() {
        
    }
    
    internal var pauseCount : Int = 0
    var paused : Bool {
        get {
            return (self.pauseCount != 0)
        }
    }
    
    func Pause() {
        self.pauseCount += 1
        if (self.pauseCount == 1) {
            self.PauseAnimations()
        }
    }
    
    func Resume() {
        if self.pauseCount > 0 {
            self.pauseCount -= 1
            if (self.pauseCount == 0) {
                self.ResumeAnimations()
            }
        }
    }
    
    
    func PauseAnimations() {
        
    }
    
    func ResumeAnimations() {
        
    }
}