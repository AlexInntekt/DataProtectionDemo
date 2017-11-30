//
//  GlobalAccess.swift
//  DataProtectionDemo
//
//  Created by Manolescu Mihai Alexandru on 30/11/2017.
//  Copyright © 2017 Manolescu Mihai Alexandru. All rights reserved.
//

import Foundation
import UIKit

class X
{
    class func isItTheFirstRun() -> Bool
    {
        var isThisTheFirstRun = Bool()
        
        if UserDefaults.standard.value(forKey: "firstLaunch") == nil
        {  // in this case, the variable is created and initialized for the first time:
            UserDefaults.standard.set(false, forKey: "firstLaunch")
            print("\n isItTheFirstRun(): This is the first time when the app is launched!")
            isThisTheFirstRun=true
        }
            
        else
        {  //in this case, the variable already exists over there.
            print("\n isItTheFirstRun(): This is NOT the first time when the app is running on this device!")
            isThisTheFirstRun=false
        }
        
        return isThisTheFirstRun
        
    } 
}


