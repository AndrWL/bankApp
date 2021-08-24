//
//  CardStyleViewController.swift
//  BankApp
//
//  Created by Andrey on 20.08.2021.
//

import UIKit


class CardStyleViewController: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }
  
}



import SwiftUI

struct CardStyleViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let cardStyleViewController = CardStyleViewController()
        
        func makeUIViewController(context: Context) -> some CardStyleViewController {
            return cardStyleViewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
