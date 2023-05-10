import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var peselTextField: UITextField!
    
    
    
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
        
        if peselTextField.text?.count != 11  {
            print(pesel.results[0].message)
        } else {
            print(pesel.checkPesel())
            print(pesel.getDate())
            print(pesel.getGender())
            resultLabel.text = pesel.checkPesel().message
        }
    }
    
}
