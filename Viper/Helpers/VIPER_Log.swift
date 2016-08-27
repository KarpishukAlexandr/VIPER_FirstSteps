//
//  VIPER_Log.swift
//  Viper
//
//  Created by Sania on 27.08.16.
//  Copyright (c) 2016 Viper. All rights reserved.
//

import Foundation
import UIKit

func LOG(object:CVarArgType?) {
#if DEBUG
    if object != nil {
        let str = String(stringInterpolationSegment: object)
        LOG("%@", callStackDepth: 2, message: str)
    } else {
        LOG("<null>", args: 2)
    }
#endif
}

func LOG(point:CGPoint) {
    #if DEBUG
        let str = "(x:'\(point.x)', y: '\(point.y)')"
        LOG("%@", callStackDepth: 2, message: str)
    #endif
}

func LOG(format:String, args:CVarArgType...) {
#if DEBUG
    let message : NSString = NSString(format: format, arguments: getVaList(args))
    LOG(format, callStackDepth:2, message:message)
#endif
}

func LOG(format:String, callStackDepth:Int, message:NSString) {
#if DEBUG
    let callStack = NSThread.callStackSymbols()
    var caller : NSString = NSString(string:"[Unknown caller]")
    var callerTarget : NSString?
    var callerClass : NSString?
    var callerFunction : NSString?
    
    if callStack.count > callStackDepth {
        caller = callStack[callStackDepth] as NSString
        var range = caller.rangeOfString("_TFC")
        if range.length > 0 {
            range.length += range.location
            range.location = 0
            caller = caller.stringByReplacingCharactersInRange(range, withString: "")
            let targetLegth = caller.integerValue
            var testLegthStr: String = String(targetLegth)
            caller = caller.substringFromIndex(testLegthStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
            callerTarget = caller.substringToIndex(targetLegth)
            caller = caller.substringFromIndex(targetLegth)
            
            let callerClassLength = caller.integerValue
            testLegthStr = String(callerClassLength)
            caller = caller.substringFromIndex(testLegthStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
            callerClass = caller.substringToIndex(callerClassLength)
            caller = caller.substringFromIndex(callerClassLength)
            
            let callerFunctionLength = caller.integerValue
            testLegthStr = String(callerFunctionLength)
            caller = caller.substringFromIndex(testLegthStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
            callerFunction = caller.substringToIndex(callerFunctionLength)
            caller = caller.substringFromIndex(callerFunctionLength)
        }
    }
    if callerClass != nil && callerFunction != nil {
        NSLog("[%@] '%@()' - %@", callerClass!, callerFunction!, message);
    } else if callerClass != nil {
        NSLog("[%@] - %@", callerClass!, message);
    } else if callerFunction != nil {
        NSLog("'%@()' - %@", callerFunction!, message);
    } else {
        NSLog("%@", message);
    }
#endif
}
