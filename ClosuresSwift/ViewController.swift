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
    
    var importantNumber = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let digit = getDigitOfPI(from: 1)
        print(digit())
        
        rotate(with: "незнайка", on: 1) {print($0)}
        
        doWork = { [weak self] in
            if let vc = self {
                vc.importantNumber += 21
                print(vc.importantNumber)
            }
        }
        
        if let doOperation = doWork {
            doOperation()
        }
        
    }
    
    
    //MARK: 3 Task
    func rotate(with string: String, on position: Int, completionBlock: @escaping (String) -> () ) {
        var array = Array(string)
        
        for i in 0 ..< position {
            
            for j in stride(from: array.count - 1, to: 0, by: -1) {
                
                let temp = array[j]
                array[j] = array[j - 1]
                array[j - 1] = temp
            }
        }
        completionBlock(String(array))
    }
    
    
    //MARK: 1 Task
    func getDigitOfPI(from position: Int) -> () -> Int {
        var charArrayPI = Array(String(Double.pi))
        charArrayPI.remove(at: 1)
        let errorMessage: Int = -1
        
        func processing() -> Int {
            if (charArrayPI.count < position) {
                
                return errorMessage
                
            } else {
                
                if let digit = Int(String(charArrayPI[position - 1])) {
                    
                    return digit
                }
            }
            return errorMessage
        }
        return processing
    }
}
