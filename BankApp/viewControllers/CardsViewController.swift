//
//  ViewController.swift
//  BankApp
//
//  Created by Andrey on 31.07.2021.
//

import UIKit



class CardsViewController: UIViewController {

 
    var banner: CardBanner!
  

    var cards: [CardModel] = [CardModel(cardImage: UIImage(named: "card_1")!, balance: 1000, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
        TransActionStory(sum: 10, comment: "healthy"),
        TransActionStory(sum: 110, comment: "study")]),
                              
        CardModel(cardImage: UIImage(named: "card_2")!, balance: 2000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
        TransActionStory(sum: 10, comment: "healthy"),
        TransActionStory(sum: 110, comment: "study")]),
        CardModel( cardImage: UIImage(named: "card_1")!, balance: 50000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
            TransActionStory(sum: 10, comment: "healthy"),
            TransActionStory(sum: 110, comment: "study")]),
        CardModel(cardImage: UIImage(named: "card_2")!, balance: 200, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
            TransActionStory(sum: 10, comment: "healthy"),
            TransActionStory(sum: 110, comment: "study")]),
        CardModel(cardImage: UIImage(named: "card_1")!, balance: 20000, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
            TransActionStory(sum: 10, comment: "healthy"),
            TransActionStory(sum: 110, comment: "study")]),
        CardModel(cardImage: UIImage(named: "card_2")!, balance: 131313, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
            TransActionStory(sum: 10, comment: "healthy"),
            TransActionStory(sum: 110, comment: "study")])
    ]
    

    
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .darkGray
        setupBanner()
        setupCardViewOnBanner()
        
        isHidden()
   

}
    
    
    // setup banner
    private func setupBanner() {
        banner = CardBanner(frame: CGRect(x: 0, y: 150, width: view.frame.width, height: 300))
        banner.backgroundColor = .darkGray
        view.addSubview(banner)
    }
    
    // setup view on banner
    
     private   func setupCardViewOnBanner() {
        banner.reloadData(numberOfItems: cards.count) { (bannerView, index) -> (UIView) in
            return self.itemView(at: index)
        }
    }
    
    // setup card Image
    
    func itemView(at: Int) -> UIImageView {
        
        let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let images = cards.map({$0.cardImage})
        imageView.contentMode = .scaleAspectFit
        imageView.image = images[at]
        
        return imageView
        
        
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
