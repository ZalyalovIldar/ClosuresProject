//
//  Closures.swift
//  ClosuresSwift
//
//  Created by Elina on 13/10/2017.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import Foundation
import UIKit

func calculateValue(with someInt: Int) -> () -> String{
    
    var k = "%." + String(someInt) + "f"
    
    
    func calculate() -> String {
        let pi = Double.pi
        let rezult = NSString(format: k as NSString, pi)
        return rezult.lastPathComponent
        
    }
    
    return calculate
}

var x = NSDecimalNumber(decimal: pow(2, 10)).intValue


