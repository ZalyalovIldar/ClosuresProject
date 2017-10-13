//
//  ViewController.swift
//  ClosuresSwift
//
//  Created by Ildar Zalyalov on 12.10.2017.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    lazy var someArray:[String] = {
        
        return ["NewValue","NewValue","NewValue","NewValue"]
    }()
    
    lazy var tableView: UITableView = {
        
        let table = UITableView(frame: self.view.frame, style: .grouped)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let value = calculateValue(with: 5)
        let value1 = calculateValue(with: 5)
        
        someArray.sort { (string1: String, string2: String) -> Bool in
            return string1 > string2
        }
        
        someArray.sort { (str1, str2) -> Bool in return str1 > str2 }
        
        someArray.sort { (str1, str2) -> Bool in str1 > str2 }
        
        someArray.sort{ $0 > $1 }
        
        someArray.sort(by: >)
        
        let a = 5
        let b = 6
        
        var sumBlock: Int = {
            return a + b
        }()
        
        print(value())
        print(value())
        print(value1())
        
        someFunction { [weak self] (myInt) in
            
            guard let strongSelf = self else { return }
            
            strongSelf.calculate(with: myInt)
            
            let value = strongSelf.someArray[myInt]
            
        }
        
        label.text = "dasd"
        label.frame.size.width = 100
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateValue(with someInt: Int) -> () -> Int{
        var value = 0
        
        func calculate() -> Int {
            
            value += someInt
            
            return value
        }
        
        return calculate
    }
    
    func calculate(with someInt: Int) -> Int {
        var value = 0
        
        return value + someInt
    }
    
    func someFunction(completion:@escaping (Int) -> (Void)) {
        
        var someInt = 5
        
        completion(someInt)
        
        let cl = SomeClass()
        let structCL = SomeStruct(name: "", age: 123)
        let secondCl = structCL
        
    }
    
}

extension Int {
    
    func sum(with int: Int) {
        return self + int
    }
}
struct SomeStruct {
    var name: String
    var age: Int
}

extension SomeStruct {
    func someFun() {
        
    }
}

class SomeClass {
    var name: String!
    var age: Int = 5
    
}

extension SomeClass {
    var newValue: Int? {
        return self.age
    }
}

