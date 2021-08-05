//
//  RegistrationViewController.swift
//  BankApp
//
//  Created by Andrey on 01.08.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    //let imageLogo = UIImage(named: "")
    let lable = UILabel(text: "🧩 PuzzLe")
    let myButton = UIButton(title: "Login", backgroundColor: #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1), titleColor: .darkGray, cornerRadius: 7)

    let userName = UITextField(backgroundColor: .lightGray, placeholder: "Username", borderStyle: .roundedRect, textColor: .darkGray)

    let password = UITextField(backgroundColor: .lightGray, placeholder: "Password", borderStyle: .roundedRect, textColor: .darkGray)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        lable.font = UIFont(name: "Avenir", size: 35)
        lable.textColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        
        
        setupConstraints()
        
        
     

       
        
    }
    
    //MARK: Setup Constraints
    
    func setupConstraints() {
        

        
        let stackView = UIStackView(arrangedSubviews: [userName, password], axis: .vertical, spacing: 16, distribution: .fillEqually)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lable)
        view.addSubview(myButton)
        view.addSubview(stackView)
        lable.translatesAutoresizingMaskIntoConstraints = false
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([lable.topAnchor.constraint(equalTo: view.topAnchor, constant:  200),
          lable.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
       
        NSLayoutConstraint.activate([stackView.centerXAnchor.constraint(equalTo: lable.centerXAnchor), stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            myButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            myButton.widthAnchor.constraint(equalToConstant: view.frame.width / 3)
])
    }
    

}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
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
