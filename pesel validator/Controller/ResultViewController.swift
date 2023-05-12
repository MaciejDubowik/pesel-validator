//
//  ResultViewController.swift
//  pesel validator
//
//  Created by Maciej Dubowik on 12/05/2023.
//

import UIKit

class ResultViewController:UIViewController {
    
    @IBOutlet weak var peselLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var pesel: String?
    var birth: String?
    var gender: String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        peselLabel.text = "PESEL: \(pesel!)"
        birthLabel.text = "Date of birth: \(birth!)"
        genderLabel.text = "Gender: \(gender!)"
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
