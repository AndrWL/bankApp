////
////  AnimateCounterBalance.swift
////  BankApp
////
////  Created by Andrey on 17.08.2021.
////
//
//import UIKit
//
//
//class AnimateCounterBalance {
//    
//    var startValue: Double = 0
//    var endValue: Double  = 0
//    let animationDuration: Double = 5
//    
//    var displayLink: CADisplayLink?
//    
//    
//    func animateLabel(to label: UILabel, card: CardModel) {
//        
//        
//        displayLink = CADisplayLink(target: self, selector: #selector (updatelabels))
//     displayLink?.add(to: .main, forMode: .default)
//        
//        
//    }
//    @objc  func updatelabels() {
//        
//        endValue = card.balance
//    
//        let animationStartDate = Date()
//        let now = Date()
//         let elapsedTime = now.timeIntervalSince(animationStartDate)
//         
//         if elapsedTime > animationDuration {
//          
//            displayLink?.invalidate()
//            displayLink = nil
//            label.text = "\(endValue) $"
//            print(endValue)
//         } else {
//         let percentage = elapsedTime / animationDuration
//            let value = startValue + percentage * (card.balance - startValue)
//             label.text = "\(value.rounded()) $"
//      
//      }
//       
//     
//      
//
//   }
//}
