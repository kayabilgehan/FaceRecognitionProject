import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    
    ///info.plish içerisine aşağıdaki satırı ekliyoruz
    //Privacy - Face ID Usage Description
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func signInClicked(_ sender: Any) {
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Barnağını bas hacı.") { success, error in
                if success == true {
                    // successful auth
                    
                    //işlemin ana thread de çalışması için aşağıdaki kody yazıyoruz
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                }
                else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                }
            }
            
        }
    }
}

