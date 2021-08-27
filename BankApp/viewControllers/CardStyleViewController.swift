//
//  CardStyleViewController.swift
//  BankApp
//
//  Created by Andrey on 20.08.2021.
//

import UIKit


class CardStyleViewController: UIViewController {
    
    let layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!
    var pageControll = UIPageControl()
    let cardStyleArray: [CardModel] = [CardModel(cardImage: "black", balance: 0, transActionStory: [], cardDescription: "Карта Black предоставляет большие возможности и очень выгодные условия для своего владельца: Большой льготный период пользования одолженными средствами – 62 дня. Сниженная ежемесячная процентная ставка – 3,2%. Возврат на годовой остаток денежных средств в размере 10% на сумму больше 100 грн."),CardModel(cardImage: "grey", balance: 0, transActionStory: [], cardDescription: "Карта Grey предоставляет большие возможности и очень выгодные условия для своего владельца: Большой льготный период пользования одолженными средствами – 62 дня. Сниженная ежемесячная процентная ставка – 3,2%. Возврат на годовой остаток денежных средств в размере 10% на сумму больше 100 грн."),CardModel(cardImage: "white", balance: 0, transActionStory: [], cardDescription: "Карта White предоставляет большие возможности и очень выгодные условия для своего владельца: Большой льготный период пользования одолженными средствами – 62 дня. Сниженная ежемесячная процентная ставка – 3,2%. Возврат на годовой остаток денежных средств в размере 10% на сумму больше 100 грн."),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatCollectionView()
        creatPageControll()
        updateConstraints()
        layout.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .darkGray
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
     
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func creatCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(CardStyleCell.self, forCellWithReuseIdentifier: "cardStyleCell")
        
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    func updateConstraints() {
        
        NSLayoutConstraint.activate([collectionView.widthAnchor.constraint(equalToConstant: view.frame.width), collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)])
        NSLayoutConstraint.activate([ pageControll.widthAnchor.constraint(equalToConstant: 100), pageControll.bottomAnchor.constraint(equalTo: view.bottomAnchor), pageControll.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    func creatPageControll() {
        view.addSubview(pageControll)
        pageControll.currentPage = 0
        pageControll.numberOfPages = cardStyleArray.count
    }
  
}

extension CardStyleViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return cardStyleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardStyleCell", for: indexPath) as! CardStyleCell
        let card = cardStyleArray[indexPath.row]
        cell.configureCell(cardsModel: card)
    
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.size.width, height: view.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControll.currentPage = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
