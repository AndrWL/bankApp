//
//  CardSelectionViewController.swift
//  BankApp
//
//  Created by Andrey on 09.08.2021.
//

import UIKit


class CardSelectionViewController: UIViewController {
 
    
    
    
   private let layout = UICollectionViewFlowLayout()
    private var collectionView: UICollectionView!
    
    var cards: [CardModel] =  [CardModel(cardImage: UIImage(named: "card_1")!, balance: 1000, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
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
        
        setupCollectionView()
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cellId")
    }
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(collectionView)
         layout.scrollDirection = .vertical
         collectionView.delegate = self
         collectionView.dataSource = self
       print(cards)
     }
    deinit {
        print("cardsSelection delete")
    }
}


extension CardSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      return  cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CardCell
        cell.backgroundColor = view.backgroundColor
        cell.image.image = cards[indexPath.row].cardImage
        
        return cell
    }
   
    
    
}


extension CardSelectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 100, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
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
