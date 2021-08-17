//
//  CardSelectionViewController.swift
//  BankApp
//
//  Created by Andrey on 09.08.2021.
//

import UIKit

protocol SelectedCardDelegate {
    
    func getCard(selectedCard: CardModel)
    
    
}
class CardSelectionViewController: UIViewController {
 
    
    let layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!
   
    
    var currentCardDelegate: SelectedCardDelegate?
    
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
        
        cell.currentCard = card
        cell.configureCell()
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 40, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = cards[indexPath.row]
        currentCardDelegate?.getCard(selectedCard: card)
        dismiss(animated: true)
       
    }
    
    
}




    
   


    
    







