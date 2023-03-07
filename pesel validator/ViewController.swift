import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var peselTextField: UITextField!
    
    let weights = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]
    let year = ["0": "19", "1": "19", "2": "20", "3": "20", "4": "21", "5": "21", "6": "22", "7": "22", "8": "18", "9": "18"]
    let monthSingleDigit = ["1": "01", "2": "02", "3": "03", "4": "04", "5": "05", "6": "06", "7": "07", "8": "08", "9": "09"]
    let monthTwoDigit = ["0": "10", "1": "11", "2": "12"]
    
    let results = [
        (status: false, message: "The PESEL must consist of 11 digits"),
        (status: false, message: "PESEL incorrect"),
        (status: true, message: "PESEL correct")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        peselTextField.endEditing(true)
        guard let text = peselTextField.text else {
            print("nil value")
            return
        }
        
        let peselArr = text.map { Int(String($0))! }
        if peselTextField.text?.count != 11  {
            print(results[0].message)
        } else {
            print(checkPesel(peselTextField.text!))
            print(getDate(peselArr))
            print(getGender(peselArr))
            resultLabel.text = checkPesel(peselTextField.text!).message
        }
    }
    
    func checkPesel(_ pesel: String) -> (status: Bool, message: String) {
        var peselArr = pesel.map { Int(String($0))! }
        var sum = 0
        peselArr.enumerated().forEach { (index, element) in
            if index == peselArr.count - 1 { return }
            sum += element * weights[index]
        }
        let checkDigit = 10 - (sum % 10)
        
        if peselArr.count != 11 { return results[0] }
        if checkDigit != peselArr[10] { return results[1] }
        return results[2]
    }
    
    func getDate(_ pesel: [Int]) -> String {
        let monthLength = pesel[2] % 2 == 0 ? monthSingleDigit[String(pesel[3])]! : monthTwoDigit[String(pesel[3])]!
        return "\(year[String(pesel[2])]!)\(pesel[0])\(pesel[1])-\(monthLength)-\(pesel[4])\(pesel[5])"
    }
    
    func getGender(_ pesel: [Int]) -> String {
        return pesel[9] % 2 == 0 ? "woman" : "man"
    }
}
