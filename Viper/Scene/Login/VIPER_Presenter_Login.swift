//
//  VIPER_Presenter_Login.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation

class VIPER_Presenter_Login : VIPER_Presenter {
    
    var interactorServer  : VIPER_Interactor_Server?
    
    override func SetupInteractor() {
        self.interactorServer = self.wireframe?.interactorServer
    }
    
    override func SetupConnections() {
        super.SetupConnections()
        
        var view = self.view as? VIPER_View_Login_IO
        view?.loginPressed = { //[unowned self] in
            let user: VIPER_Entity_User = VIPER_Entity_User()
            user.email = view?.email
            user.firstName = view?.firstName
            user.lastName = view?.lastName
            self.interactorServer?.Login(user)
        }
        
        self.interactorServer?.LoginCompleted = { (user:VIPER_Entity_User, error:NSError?)->Void in
            self.wireframe?.Push(VIPER_FRAME.Main, animated:true)
        }
    }
    
}

extension VIPER_Presenter_Login : VIPER_Presenter_Login_IO {
    
}