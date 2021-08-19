//
//  RegistrationViewController.swift
//  BankApp
//
//  Created by Andrey on 01.08.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    let lable = UILabel(text: "🧩 PuzzLe")
    let myButton = UIButton(backgroundColor: #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1), titleColor: .darkGray, cornerRadius: 7)
    let errorLabel = UILabel()
    let email = UITextField(backgroundColor: .lightGray, placeholder: "Username", borderStyle: .roundedRect, textColor: .darkGray)

    let password = UITextField(backgroundColor: .lightGray, placeholder: "Password", borderStyle: .roundedRect, textColor: .darkGray)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        lable.font = UIFont(name: "Avenir", size: 35)
        lable.textColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        errorLabel.alpha = 0
        view.addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        
        isHidden()
        setupConstraints()
        email.delegate = self
        password.delegate = self
       

       
        
    }
    
    //MARK: Setup Constraints
    
    func setupConstraints() {
        

        
        let stackView = UIStackView(arrangedSubviews: [email, password], axis: .vertical, spacing: 16, distribution: .fillEqually)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lable)
        view.addSubview(myButton)
        view.addSubview(stackView)
        lable.translatesAutoresizingMaskIntoConstraints = false
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.setTitle("Enter", for: .normal)
        myButton.addTarget(self, action: #selector(buttomTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([lable.topAnchor.constraint(equalTo: view.topAnchor, constant:  200),
          lable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
       
        NSLayoutConstraint.activate([stackView.centerXAnchor.constraint(equalTo: lable.centerXAnchor), stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            myButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            myButton.widthAnchor.constraint(equalToConstant: view.frame.width / 3)
            
          
])
        NSLayoutConstraint.activate([ errorLabel.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 10), errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        
    }
    func displayWarning(withText text: String) {
        errorLabel.text = text
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {[weak self] in
            self?.errorLabel.alpha = 1
        } completion: {[weak self] complete in
            self?.errorLabel.alpha = 0
        }

    }
    
    @objc private func buttomTapped() {
        let tapticFeedback = UINotificationFeedbackGenerator()
       
      
        guard let mail = email.text, let password = password.text, mail != "", password != "" else { displayWarning(withText: "incorrect form")
            tapticFeedback.notificationOccurred(.error)
            return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: mail, password: password) { [weak self] (user, error) in
            if error != nil {
                self?.displayWarning(withText: "Error userName or password")
                tapticFeedback.notificationOccurred(.error)
                return
            }
            if user != nil {
                let tabbar = MainTabBarController()
                self?.navigationController?.pushViewController(tabbar, animated: true)
                return
            }
            self?.displayWarning(withText: "no such User")
        }
     
          }
       
    
    deinit {
        print("Удален")
    }

}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        email.resignFirstResponder()
        password.resignFirstResponder()
        
        return true
    }
}




