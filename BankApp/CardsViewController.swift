//
//  ViewController.swift
//  BankApp
//
//  Created by Andrey on 31.07.2021.
//

import UIKit

class CardsViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        layout.scrollDirection = .vertical
        return layout
    }()
    
    
    let cellId = "cell"
    var imageArray: [CardModel] = [CardModel(id: 1, cardImage: UIImage(named: "card_1")), CardModel(id: 2, cardImage: UIImage(named: "card_2")), CardModel(id: 3, cardImage: UIImage(named: "card_2")), CardModel(id: 4, cardImage: UIImage(named: "card_1"))]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
       
    }

}




extension CardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(imageArray.count)
        return imageArray.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CardCell
        
        let nameImage = imageArray[indexPath.row]
        
        
        cell.cardImage.image = nameImage.cardImage
        
      
        return cell
        
    }
    
    
}

extension CardsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
        
        print(#function)
        
            return CGSize(width: 280, height: 200)
    }
    
    
}



