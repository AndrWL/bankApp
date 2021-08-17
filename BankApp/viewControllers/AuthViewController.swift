//
//  RootviewController.swift
//  BankApp
//
//  Created by Andrey on 09.08.2021.
//

import UIKit

class AuthViewController: UIViewController {
  
    
    
 
    let lable = UILabel(text: "🧩 PuzzLe")
    let singUpButton = UIButton(backgroundColor: #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1), titleColor: .darkGray, cornerRadius: 7)
    let loginButton = UIButton(backgroundColor: #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1), titleColor: .darkGray, cornerRadius: 7)
    let stackView = UIStackView()

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        lable.font = UIFont(name: "Avenir", size: 35)
        lable.textColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        view.addSubview(stackView)
        view.addSubview(lable)
        
        isHidden()
        setupStackView()
        setupConstraints()
        
        
     

       
        
    }
    
  private  func setupStackView() {
    
  
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 16
    stackView.addArrangedSubview(loginButton)
    stackView.addArrangedSubview(singUpButton)
    
        }
    
    //MARK: Setup Constraints
    
    private   func setupConstraints() {
       
        lable.translatesAutoresizingMaskIntoConstraints = false
        
        singUpButton.setTitle("Sing Up", for: .normal)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(buttomTapped), for: .touchUpInside)
   
        
        
        NSLayoutConstraint.activate([
                                     lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
       
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.centerYAnchor), stackView.widthAnchor.constraint(equalToConstant: view.frame.width / 2), stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
      
    }
    
    @objc private func buttomTapped() {
        
        self.dismiss(animated: true)
        let loginViewController = LoginViewController()
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
       
        
       
    }
    deinit {
        print("1st Delete")
    }
}



import SwiftUI

struct AuthView : PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
