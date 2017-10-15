//
//  ViewController.swift
//  ClosuresHW
//
//  Created by Дамир Зарипов on 15.10.17.
//  Copyright © 2017 Дамир Зарипов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var doWork: (() -> Void)?
    var multiplayTest = 10
    //var complitionBlock: ((String, Int) -> String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }
    
    //MARK: - Test
    
    func test() {
        //Test Exercise1
        let testEx1 = getNumberOfPi(position: 4)
        print (testEx1())
        
        //Test Exercise2
        doWork = { [weak self] in
            if let mySelf = self {
                mySelf.multiplayTest = 10 * 5
                print(mySelf.multiplayTest)
            }
        }
        
        if let doWorkCheck = doWork {
            doWorkCheck()
        }
    
        //Test Exercise3
        let testEx3 = shiftCharacters(in: "Hello World", by: 2)
        print(testEx3)
    }
    
    //MARK: - Exercise1
    func getNumberOfPi(position: Int) -> () -> Int {
        
        let falseValue:Int = -1
        let stringPi = String(Double.pi)
        let delCharSet = CharacterSet(charactersIn: "3.")
        let fractionalPartOfPi: String = stringPi.trimmingCharacters(in: delCharSet)
        
        func findNumberOfPi() -> Int {
            guard position > 0 else {return falseValue}
            let arrayOfNumbersOfFractionalPart = Array(fractionalPartOfPi)
            let numberOfPosition = arrayOfNumbersOfFractionalPart[position - 1]
            if let digit = Int(String(numberOfPosition)) {
                return digit
            }
            return falseValue
        }
        return findNumberOfPi
    }

    //MARK: - Exercise3
    
    func shiftCharacters(in string: String, by shiftTo: Int) -> String {
    
        var result: String = string
        
        for _ in 0 ..< shiftTo {
            var tempArray = Array(result)
            let lastCharacter:Character = tempArray.removeLast()
            result = String(lastCharacter) + String(tempArray)
        }
        
        return result
    }
    
}

