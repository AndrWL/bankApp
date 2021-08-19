




import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
   private let lable = UILabel(text: "Welcome" )
   private  let email = UITextField(backgroundColor: .lightGray, placeholder: "Username", borderStyle: .roundedRect, textColor: .darkGray)
   private let password = UITextField(backgroundColor: .lightGray, placeholder: "Password", borderStyle: .roundedRect, textColor: .darkGray)
   private let stackView = UIStackView()
    private let registerButton = UIButton(backgroundColor: #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1), titleColor: .black, cornerRadius: 7)
    let errorLabel = UILabel()
    private let goToLogin = UIButton(backgroundColor: .darkGray, titleColor: .white, cornerRadius: 7)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        lable.font = UIFont(name: "Avenir", size: 35)
        lable.textColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        isHidden()
        email.delegate = self
        password.delegate = self
        view.addSubview(registerButton)
      
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(lable)
        
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textAlignment = .center
        
        setupStackView()
        setupButtons()
        setupConstraints()
        
    }
   func setupStackView() {
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(password)
        stackView.axis = .vertical
        stackView.spacing = 16
    }
    
    func setupButtons() {
        view.addSubview(goToLogin)
        view.addSubview(registerButton)
        
        goToLogin.translatesAutoresizingMaskIntoConstraints = false
        goToLogin.setTitle("have account?", for: .normal)
        goToLogin.addTarget(self, action: #selector(toLogin), for: .touchUpInside)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func toLogin() {
        
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([lable.widthAnchor.constraint(equalToConstant: view.frame.size.width/2), lable.centerXAnchor.constraint(equalTo: view.centerXAnchor), lable.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)])
        NSLayoutConstraint.activate([stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80), stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor), stackView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2)])
        
        NSLayoutConstraint.activate([registerButton.widthAnchor.constraint(equalToConstant: view.frame.width/2), registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), registerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)])
        
        NSLayoutConstraint.activate([goToLogin.widthAnchor.constraint(equalToConstant: 100),goToLogin.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),goToLogin.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)])
    }
    
    func displayWarning(withText text: String) {
        errorLabel.text = text
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {[weak self] in
            self?.errorLabel.alpha = 1
        } completion: {[weak self] complete in
            self?.errorLabel.alpha = 0
        }

    }
    

    
    @objc func buttonTapped() {
        
        guard let name = email.text, let password = password.text, name != "", password != "" else {
            return
        }
      
        FirebaseAuth.Auth.auth().createUser(withEmail: name, password: password) { [weak self] (user, error) in
                if error != nil {
                    print(error)
                    if user != nil {
                        let tabbar = MainTabBarController()
                        self?.navigationController?.pushViewController(tabbar, animated: true)
                    }
                  
            }
         
        }
    }
    deinit {
        print("\(#function) Easdasdasda")
    }
}


extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        email.resignFirstResponder()
        password.resignFirstResponder()
        
        return true
    }
}


import SwiftUI

struct Register : PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = RegistrationViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
