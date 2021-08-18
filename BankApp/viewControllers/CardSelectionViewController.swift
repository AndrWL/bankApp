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
    var addCardButton = UIButton(backgroundColor: #colorLiteral(red: 0.6044693589, green: 0.8744841814, blue: 0.6529840231, alpha: 1), titleColor: .black, cornerRadius: 7)
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 200)
        view.backgroundColor = .black
       
        view.addSubview(collectionView)
        
        
        
        addCardButton.frame = CGRect(x: 0, y: 100, width: 200, height: 200)
        addCardButton.setTitle("add card", for: .normal)
        view.addSubview(addCardButton)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addCardButton.translatesAutoresizingMaskIntoConstraints = false
        creatConstreints()
        print(collectionView.frame.height)
    }


   
    
    
 
    deinit {
        print("cardsSelection delete")
    }
    
    private func creatConstreints() {
      
        NSLayoutConstraint.activate([collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
                                     collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor) , collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: +80),collectionView.heightAnchor.constraint(equalToConstant: view.frame.height/2)
                                   ])
        NSLayoutConstraint.activate([addCardButton.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
                                     addCardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),addCardButton.widthAnchor.constraint(equalToConstant: collectionView.frame.width/2)])
    }
    
    
}


extension CardSelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCell
        let card = cards[indexPath.row]
       
      
        
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




    
   


    
    







