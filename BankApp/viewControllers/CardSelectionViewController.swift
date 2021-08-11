//
//  CardSelectionViewController.swift
//  BankApp
//
//  Created by Andrey on 09.08.2021.
//

import UIKit


class CardSelectionViewController: UIViewController {
 
    
    let layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!
        
   
    
    
    var cards: [CardModel] =  [CardModel(cardImage: UIImage(named: "card_1")!, balance: 1000, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
                                                                                                                  TransActionStory(sum: 10, comment: "healthy"),
                                                                                                                  TransActionStory(sum: 110, comment: "study")]),
                                                                   
                                                                                     CardModel(cardImage: UIImage(named: "card_2")!, balance: 2000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
                                                                                                                  TransActionStory(sum: 10, comment: "healthy"),
                                                                                                                  TransActionStory(sum: 110, comment: "study")]),
                                                                                                                  CardModel( cardImage: UIImage(named: "card_3")!, balance: 50000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
                                                                                                                      TransActionStory(sum: 10, comment: "healthy"),
                                                                                                                      TransActionStory(sum: 110, comment: "study")])]
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
     
        
        
      
      
       
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cell")
        
       
       
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    
 
    deinit {
        print("cardsSelection delete")
    }
}


extension CardSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCell
        let card = cards[indexPath.row]
        cell.configureCell(image: card.cardImage, text: "\(card.balance) $")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 40, height: 80)
    }
    
    
    
}


   
    
    






import SwiftUI

struct CardsSelectionViewController: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let cardselection = CardSelectionViewController()
        
        func makeUIViewController(context: Context) -> some CardSelectionViewController {
            return cardselection
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
