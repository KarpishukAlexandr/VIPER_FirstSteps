//
//  VIPER_Wireframe_Impl.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright © 2016 Sania. All rights reserved.
//

import Foundation
import UIKit

class VIPER_Wireframe_Impl : NSObject, VIPER_Wireframe {
    
    var storyboard: UIStoryboard?
    internal var p_navigationVC : UINavigationController?
    var navigationVC : UINavigationController? {
        get {
            return self.p_navigationVC
        }
        set {
            self.p_navigationVC = newValue
            self.p_navigationVC?.delegate = self
        }
    }
    internal var p_interactorPayment : VIPER_Interactor_Payment?
    internal var p_interactorServer : VIPER_Interactor_Server?

    var interactorPayment : VIPER_Interactor_Payment? {
        get {
            if (self.p_interactorPayment == nil) {
                self.p_interactorPayment = VIPER_Interactor_Payment_Stripe()
            }
            return self.p_interactorPayment
        }
    }
    var interactorServer : VIPER_Interactor_Server? {
        get {
            if (self.p_interactorServer == nil) {
                self.p_interactorServer = VIPER_Interactor_Server_General()
            }
            return self.p_interactorServer
        }
    }
    
    
    func CreateFrame(frame:VIPER_FRAME) -> VIPER_Frame? {
        var frameImpl : VIPER_Frame?
        
        switch (frame) {
            case .Login:
                frameImpl = VIPER_Frame_Login()
                break
                
            case .Main:
                frameImpl = VIPER_Frame_Main()
                break
                
            case .Stripe:
                frameImpl = VIPER_Frame_Stripe()
                break
        }
        
        if (frameImpl != nil) {
            frameImpl?.Setup(self)
        }
        
        return frameImpl
    }
    
    func SwitchTo(frame:VIPER_FRAME) -> Bool {
        let frameImpl : VIPER_Frame? = self.CreateFrame(frame)
        if (frameImpl != nil) {
            self.Replace(frameImpl?.presenter?.view)
            
            return true
        }
        
        return false
    }
    
    func Push(view:VIPER_View!, animated:Bool = true) {
        self.navigationVC?.pushViewController(view, animated:animated)
    }

    func Push(frame:VIPER_FRAME, animated:Bool = true) {
        let frameImpl : VIPER_Frame? = self.CreateFrame(frame)
        LOG("Push " + frameImpl!.storyboardName + "." + frameImpl!.storyboardRepresentationID)
        self.Push(frameImpl?.presenter?.view, animated: animated)
    }
    
    func Pop(animated:Bool = true) {
        self.navigationVC?.popViewControllerAnimated(animated)
    }
    
    func Replace(view:VIPER_View!, animated:Bool = true) {
        self.navigationVC?.setViewControllers([view], animated: animated)
    }
    
    func Replace(frame:VIPER_FRAME, animated:Bool = true) {
        let frameImpl : VIPER_Frame? = self.CreateFrame(frame)
        LOG("Replace " + frameImpl!.storyboardName + "." + frameImpl!.storyboardRepresentationID)
        self.Push(frameImpl?.presenter?.view, animated: animated)
    }
    
}

//MARK: - UINavigationControllerDelegate
extension VIPER_Wireframe_Impl : UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        
        let view = viewController as! VIPER_View
        view.presenter?.Pause()
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        
        let view = viewController as! VIPER_View
        view.presenter?.Resume()
    }
    
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        
        return UIInterfaceOrientationMask.AllButUpsideDown
    }
    
    func navigationControllerPreferredInterfaceOrientationForPresentation(navigationController: UINavigationController) -> UIInterfaceOrientation {
        
        return UIInterfaceOrientation.Portrait
    }
    
 /*   func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
    }*/
}