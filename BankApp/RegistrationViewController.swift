//
//  RegistrationViewController.swift
//  BankApp
//
//  Created by Andrey on 01.08.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    

    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    

    @IBAction func userNameAction(_ sender: UITextField) {
        guard userNameTextfield.text?.isEmpty == false else {
            return
        }
        if let _ = Double(userNameTextfield.text!) {
            let alert = UIAlertController(title: "Warning", message: "UserName must use character", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(okAction)
            present(alert, animated: true)
        }
        
    }
    
    @IBAction func passwordAction(_ sender: UITextField) {
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMain" {
            print("yes")
        }
    }

}
