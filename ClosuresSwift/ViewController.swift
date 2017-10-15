//
//  ViewController.swift
//  ClosuresSwift
//
//  Created by Ildar Zalyalov on 12.10.2017.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var doWork: (() ->Void)?
    var testSum = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testMethods()
    }
    
    private func testMethods() {
        let findPiDigitMethod = digitInPI(position: 5)
        print(findPiDigitMethod())
        
        testWork()
        
        move(string: "HelloWorld", to: 5) { print($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - first exercise
    
    private func digitInPI(position: Int) -> () -> Int {
        
        func findDigit() -> Int {
            let fraction = 1
            let errorCode = -1
            let seperator = "."
            
            let stringPI = String(Double.pi)
            let partsOfPI = stringPI.components(separatedBy: seperator)
            let fractionString = partsOfPI[fraction]
            if fractionString.count < position {
                return errorCode
            }
            let charactefOfDigit:String = fractionString[position]
            if let digit = Int(charactefOfDigit) {
                return digit
            }
            return errorCode
        }
        
        return findDigit
    }
    
    //MARK: - second exercise
    
    private func testWork() {
        doWork = { [weak self] in
            if let selfWrapped = self {
                selfWrapped.testSum += 50
                print(selfWrapped.testSum)
            }
        }
        if let work = doWork {
            work()
        }
    }
    
    //MARK: - third exercise
    
    private func move(string: String, to position: Int, completionBlock: @escaping (String) -> ()) {
        var result = string
        for _ in 0 ..< position {
            let lastChar = result.removeLast()
            result = String(lastChar) + result
        }
        completionBlock(result)
    }
    
}

extension String {
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

}
