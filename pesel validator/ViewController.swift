//
//  ViewController.swift
//  pesel validator
//
//  Created by Maciej Dubowik on 04/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var peselTextField: UITextField!
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        peselTextField.endEditing(true)
        let peselArr = peselTextField.text!.map { Int(String($0))! }
//        peselTextField.text?.isEmpty ?? true 
        if peselTextField.text?.count != 11  {
            print(results[0].message)
        } else {
            print(checkPesel(peselTextField.text!))
            print(getDate(peselArr))
            print(getGender(peselArr))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var sum = 0
    var checkDigit = 0
    let weights = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]
    let year = ["0": "19", "1": "19", "2": "20", "3": "20", "4": "21", "5": "21", "6": "22", "7": "22", "8": "18", "9": "18"]
    let monthSingleDigit = ["1": "01", "2": "02", "3": "03", "4": "04", "5": "05", "6": "06", "7": "07", "8": "08", "9": "09"]
    let monthTwoDigit = ["0": "10", "1": "11", "2": "12"]
    let results = [
        (status: false, message: "The PESEL must consist of 11 digits"),
        (status: false, message: "PESEL incorrect"),
        (status: true, message: "PESEL correct")
    ]
    
    func checkPesel(_ pesel: String) -> (status: Bool, message: String) {
        var peselArr = pesel.map { Int(String($0))! }
        sum = 0
        peselArr.enumerated().forEach { (index, element) in
            if index == peselArr.count - 1 { return }
            sum += element * weights[index]
        }
        checkDigit = 10 - (sum % 10)
        if peselArr.count != 11 { return results[0] }
        if checkDigit == peselArr[10] { return results[2] }
        return results[1]
    }
    
    func getDate(_ pesel: [Int]) -> String {
        let monthLenght = pesel[2] % 2 == 0 ? monthSingleDigit[String(pesel[3])]! : monthTwoDigit[String(pesel[3])]!
        return "\(year[String(pesel[2])]!)\(pesel[0])\(pesel[1])-\(monthLenght)-\(pesel[4])\(pesel[5])"
    }
    
    
    func getGender(_ pesel: [Int]) -> String {
        return pesel[9] % 2 == 0 ? "woman" : "man"
    }
    
    
}



