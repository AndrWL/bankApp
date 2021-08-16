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
        
   
    
    
    var cards: [CardModel] =  []
    
    
    
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
        guard let image = UIImage(named: card.cardImage) else{ return UICollectionViewCell() }
        cell.configureCell(image: image, text: "\(card.balance) $")
        
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
