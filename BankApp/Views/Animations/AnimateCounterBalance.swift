//
//  AnimateCounterBalance.swift
//  BankApp
//
//  Created by Andrey on 17.08.2021.
//

import UIKit


struct AnimateCounterBalance {
    
    var startValue: Double = 0
    var endValue: Double  = 0
    let animationDuration: Double = 0.5
    let animationStartDate = Date()
    
    func animateLabel(to label: UILabel, card: CardModel) {
        let now = Date()
         let elapsedTime = now.timeIntervalSince(animationStartDate)
         
         if elapsedTime > animationDuration {
            label.text = "\(endValue) $"
         } else {
         let percentage = elapsedTime / animationDuration
            let value = startValue + percentage * (card.balance - startValue)
             label.text = "\(value.rounded()) $"
      
      }
    }
}
