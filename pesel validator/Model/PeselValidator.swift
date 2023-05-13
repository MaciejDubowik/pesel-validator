//
//  Pesel.swift
//  pesel validator
//
//  Created by Maciej Dubowik on 09/05/2023.
//

import Foundation

struct PeselValidator {
    let peselValue: [Int]
    let weights = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]
    let year = ["0": "19", "1": "19", "2": "20", "3": "20", "4": "21", "5": "21", "6": "22", "7": "22", "8": "18", "9": "18"]
    let monthSingleDigit = ["1": "01", "2": "02", "3": "03", "4": "04", "5": "05", "6": "06", "7": "07", "8": "08", "9": "09"]
    let monthTwoDigit = ["0": "10", "1": "11", "2": "12"]
    let results = [
        (status: false, message: "The PESEL must consist of 11 digits"),
        (status: false, message: "PESEL incorrect"),
        (status: true, message: "PESEL correct")
    ]
    
    
    func checkPesel() -> (status: Bool, message: String) {
        if peselValue.count != 11 {return results[0]}
        
        var sum = 0
        
        peselValue.enumerated().forEach { (index, element) in
            if index == peselValue.count - 1 { return }
            sum += element * weights[index]
        }
        let checkDigit = 10 - (sum % 10)
        
        if checkDigit != peselValue[10] { return results[1] }
        return results[2]
    }
    
    func getDate() -> String {
        let monthLength = peselValue[2] % 2 == 0 ? monthSingleDigit[String(peselValue[3])]! : monthTwoDigit[String(peselValue[3])]!
        return "\(year[String(peselValue[2])]!)\(peselValue[0])\(peselValue[1])-\(monthLength)-\(peselValue[4])\(peselValue[5])"
    }
    
    func getGender() -> String {
        return  peselValue[9] % 2 == 0 ? "female" : "male"
    }
}
