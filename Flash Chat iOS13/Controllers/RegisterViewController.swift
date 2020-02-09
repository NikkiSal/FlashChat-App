

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription) // localized means in the users language
                    //but for real, make a popup or put the label the description into a label  so that the user knows, what's wrong.
                } else {
                    //Navigate to the Chat viewController
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self) //self. is neccessary becuase we are inside a closure inside of any methods we are calling on the current class
                }
            }
        }
    }
    
}
