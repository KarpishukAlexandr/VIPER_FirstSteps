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
    var viewLogin : VIPER_View_Login_IO? {
        get {
            return self.view as? VIPER_View_Login_IO
        }
        set{}
    }
    
    override func SetupInteractor() {
        self.interactorServer = self.wireframe?.interactorServer
    }
    
    override func SetupConnections() {
        super.SetupConnections()
        
        self.viewLogin?.loginPressed = { [unowned self] in
            let user: VIPER_Entity_User = VIPER_Entity_User()
            user.email = self.viewLogin?.email
            user.firstName = self.viewLogin?.firstName
            user.lastName = self.viewLogin?.lastName
            self.interactorServer?.Login(user)
        }
        
        self.interactorServer?.LoginCompleted = { [unowned self] (user:VIPER_Entity_User, error:NSError?)->Void in
            self.wireframe?.Push(VIPER_FRAME.Main, animated:true)
        }
    }
    
}

extension VIPER_Presenter_Login : VIPER_Presenter_Login_IO {
    
}