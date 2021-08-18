//
//  CardCell.swift
//  BankApp
//
//  Created by Andrey on 03.08.2021.
//

import UIKit


class CardCell: UICollectionViewCell {
    
    var currentCard: CardModel?
    let startValue: Double = 0
    let animationDuration: Double = 0.5
     let animationStartDate = Date()
    var displayLink: CADisplayLink?
    var endValue: Double = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        contentView.layer.cornerRadius = 10
        contentView.addSubview(cardsImage)
        contentView.addSubview(balanceLabel)
        contentView.backgroundColor = .darkGray
        displayLink = CADisplayLink(target: self, selector: #selector(updatelabels))
        displayLink?.add(to: .main, forMode: .default)
     
        
    }
    var cardsImage = UIImageView()
    var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "1000000"
        label.tintColor = .white
        return label
    }()
        
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        cardsImage.frame = CGRect(x: 20 , y: 20, width: contentView.frame.size.width/4, height: contentView.frame.size.height/2)
        
        balanceLabel.frame = CGRect(x: 150, y: 2, width: frame.width, height: contentView.frame.height)
    
    }
   
        

    public func configureCell() {
     
        balanceLabel.text = "\(currentCard!.balance)"
        cardsImage.image = UIImage(named: currentCard!.cardImage)
        endValue = currentCard?.balance ??  0
     
      
    }
    
   
    @objc  func updatelabels() {

            let now = Date()
             let elapsedTime = now.timeIntervalSince(animationStartDate)

             if elapsedTime > animationDuration {
                displayLink?.invalidate()
                displayLink = nil
                print(endValue)
                balanceLabel.text = "\(endValue) $"
             } else {
             let percentage = elapsedTime / animationDuration
                let value = startValue + percentage * (endValue - startValue)
                 balanceLabel.text = "\(value.rounded()) $"


        }
      

   }
       

    

}
