//
//  CardAnimation.swift
//  BankApp
//
//  Created by Andrey on 17.08.2021.
//

import UIKit


class CardAnimation {
    
   var isFliped = true
    func creatAnimation(image: UIImageView?, model: CardModel) {
    
    guard let currentCardImage = image else { return  }
    
    guard let BackImageimage = UIImage(named: "\(model.cardImage)flip") else { return }
    guard  let frontImage = UIImage(named: "\(model.cardImage)") else {
        return
    }


    if isFliped {
        print("first")
        UIView.transition(with: currentCardImage, duration: 0.8, options: .transitionFlipFromLeft)  {
            currentCardImage.image = BackImageimage
            self.isFliped = false
            
        }
} else {
    print("2nd")
    UIView.transition(with: currentCardImage, duration: 0.8, options: .transitionFlipFromLeft) {
    
   
        currentCardImage.image = frontImage
        self.isFliped = true
    }
}
    
    }
}
