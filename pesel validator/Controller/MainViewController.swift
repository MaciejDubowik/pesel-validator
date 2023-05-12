import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var peselTextField: UITextField!
    
    var birthDate: String = ""
    var gender: String = ""
    
    
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
        var pesel = Pesel(peselValue: peselArr)
        
        if peselTextField.text?.count != 11 || pesel.checkPesel().status == false {
            resultLabel.text = pesel.checkPesel().message
            resultLabel.textColor = UIColor.red
        } else{
            birthDate = pesel.getDate()
            gender = pesel.getGender()
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.pesel = peselTextField.text
            destinationVC.birth = birthDate
            destinationVC.gender = gender
        }
    }
}
