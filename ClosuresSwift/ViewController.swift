import UIKit

class ViewController: UIViewController {
    
    let dotSeporator:Character = "."
    let stringToWorkWith = "Hello"
    let primal:Character = "!"
    var doSomeFunction: (() -> Void)!
    var someValue = 99999
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testingMethods()
    }
    func testingMethods() {
        
        // MARK:- first task testing
        let calculatedKValue = calculateKNumber(with: 99999)
        print(calculatedKValue())
        
        // MARK:- second task testing
        doSomethingFunction()
        // MARK:- third task testing
        shift(string: stringToWorkWith, to: 13) { (stringToWorkWith) -> (Void) in
            print(stringToWorkWith)
        }
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
            if test.count < position {
                return -1
            } else {
            let test:String = String(test[position])
            
            let kNumber = Int(test)
            
            return kNumber!
            }
        }
        return calculatePisKNumber
    }
    
    //    MARK:- second task
    func doSomethingFunction() {
        doSomeFunction = {[weak self] in
            guard let strongSelf = self else { return }
            strongSelf.someValue *= 999999
            print(strongSelf.someValue)
        }
        guard let doSomething = doSomeFunction else { return }
        doSomething()
    }
   
    
    //    MARK:- third task
    func shift(string: String,to number: Int, completionBlock: @escaping (String) -> (Void) ) {
        doSomeFunction = {
        var resultString = string
        for _ in 0 ..< number {
            let lastCharecter = resultString.removeLast()
            resultString = String(lastCharecter) + resultString
        }
        completionBlock(resultString)
        }
    }
}
