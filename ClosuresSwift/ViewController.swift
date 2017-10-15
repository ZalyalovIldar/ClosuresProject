//
//  ViewController.swift
//  ClosuresSwift
//
//  Created by Ildar Zalyalov on 12.10.2017.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var doWork: (() -> Void)?
    let ten = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testingTasks()

    }
    
    func testingTasks() {
        
        let value = calculateNumberInPi(with: 7)
        print(value())
        
        doWork = { [weak self] in
            guard let strongSelf = self else { return }
            let rezult = strongSelf.addition(first: 5, second: 8)
            print(rezult)
        }
        print(doWork!())
        
        rotate (string: "незнайка", on: 1) { string, number in
            var rezult = string
            for _ in 0..<number {
                let lastChar = rezult.removeLast()
                rezult = String(lastChar) + rezult
            }
            return rezult
        }
    }
    
    //Task 1
    
    func calculateNumberInPi(with someInt: Int) -> () -> Int {
        var powerOfTen = NSDecimalNumber(decimal: pow(Decimal(ten), someInt)).doubleValue
        let pi = Double.pi
        
        func calculate() -> Int {

            var rezult = Double(round(powerOfTen * pi) / powerOfTen)
            powerOfTen = powerOfTen / Double(ten)
            rezult = (rezult * powerOfTen).truncatingRemainder(dividingBy: Double(ten))
            
            return Int(rezult)
        }
        return calculate
    }
    
    //Task 2
    
    func addition(first: Int, second: Int) -> Int {
        return first + second
    }
    
    //Task 3
    
    func rotate(string: String, on number: Int, completion:@escaping (String, Int) -> String) {
        let rezult = completion(string, number)
        print(rezult)
    }
}

