import UIKit

class ViewController: UIViewController {
    
    let dotSeporator:Character = "."
    let stringToWorkWith = "Hello"
    let primal:Character = "!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testingMethods()
    }
    func testingMethods() {
        
        // MARK:- first task testing
        let calculatedKValue = calculateKNumber(with: 10)
        print(calculatedKValue())
        
        // MARK:- second task testing
        doSomeFunction = {firstValue,secondValue in
            return firstValue / secondValue
        }
        print(doSomeFunction(10,5))
        doSomeFunction = {firstValue,secondValue in
            return firstValue * secondValue
        }
        
        print(doSomeFunction(10,5))
        
        doSomeFunction = {firstValue,secondValue in
            return firstValue - secondValue
        }
        print(doSomeFunction(10,5))
        
        doSomeFunction = {firstValue,secondValue in
            return firstValue + secondValue
        }
        print(doSomeFunction(10,5))
        
        // MARK:- third task testing
        shift(string: stringToWorkWith, to: 2) {print($0)}
    }
    
    //    MARK: - first task
    func calculateKNumber(with kInt: Int) -> () -> Int {
        let position = kInt
        var test: [Character] = [primal]
        func calculatePisKNumber() -> Int {
            let stringOfPiNumber = String(Double.pi)
            let divisionedPi = stringOfPiNumber.split(separator: dotSeporator)[1]
            for i in divisionedPi.characters {
                test.append(i)
            }
            let test:String = String(test[position])
            
            let kNumber = Int(test)
            
            return kNumber!

        }
        return calculatePisKNumber
    }
    
    //    MARK: - second task
    var doSomeFunction: ((Int,Int) -> Int)!
    
    //    MARK:- third task
    func shift(string: String,to number: Int, completionBlock: @escaping (String) -> (Void) ) {
        var resultString = string
        for _ in 0 ..< number {
            let lastCharecter = resultString.removeLast()
            resultString = String(lastCharecter) + resultString
        }
        completionBlock(resultString)
    }
}
