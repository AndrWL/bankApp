//
//  ViewController.swift
//  BankApp
//
//  Created by Andrey on 31.07.2021.
//

import UIKit



class CardsViewController: UIViewController {

 
    var cardImage: UIImageView?
    
    private let addCardButtom = UIButton(backgroundColor: .darkGray, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 10)
    var cards: [CardModel] = [CardModel(cardImage: UIImage(named: "card_1")!, balance: 1000, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
        TransActionStory(sum: 10, comment: "healthy"),
        TransActionStory(sum: 110, comment: "study")]),
                              
        CardModel(cardImage: UIImage(named: "card_2")!, balance: 2000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
        TransActionStory(sum: 10, comment: "healthy"),
        TransActionStory(sum: 110, comment: "study")]),
        CardModel( cardImage: UIImage(named: "card_1")!, balance: 50000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
            TransActionStory(sum: 10, comment: "healthy"),
            TransActionStory(sum: 110, comment: "study")])]
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .darkGray
        
        
        setupButton()
        setConstraints()
         isHidden()
   

}
    
  
    
   private func setupButton() {
    
    view.addSubview(addCardButtom)
    
  
    addCardButtom.translatesAutoresizingMaskIntoConstraints = false
    
    let imageButtom = UIImage(systemName: "plus.rectangle.on.rectangle")
  
    addCardButtom.setBackgroundImage(imageButtom, for: .normal)
  
    addCardButtom.tintColor = .lightGray
    addCardButtom.addTarget(self, action: #selector(addCard), for: .touchUpInside)
    
   
    
    }
    private func setupUIImage() {
        
    }
    
    @objc private func addCard() {
        
        let cardSelectionViewController = CardSelectionViewController()
        cardSelectionViewController.cards = cards
    
        self.present(cardSelectionViewController, animated: true)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            addCardButtom.widthAnchor.constraint(equalToConstant: 30),
            addCardButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addCardButtom.topAnchor.constraint(equalTo: view.topAnchor, constant: +40),
            addCardButtom.heightAnchor.constraint(equalTo: addCardButtom.widthAnchor)
           
    ])
     
    }
    
    deinit {
        print("collection delete")
    }
   
}










//MARK: SwiftUI canvas

import SwiftUI

struct CardsViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = CardsViewController()
        
        func makeUIViewController(context: Context) -> some CardsViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
