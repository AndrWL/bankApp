//
//  CardCell.swift
//  BankApp
//
//  Created by Andrey on 03.08.2021.
//

import UIKit


class CardCell: UICollectionViewCell {
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        contentView.layer.cornerRadius = 10
        contentView.addSubview(cardsImage)
        contentView.addSubview(balanceLabel)
        contentView.backgroundColor = .darkGray
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
    public func configureCell(image: UIImage, text: String) {
        cardsImage.image = image
        cardsImage.contentMode = .scaleAspectFit
        balanceLabel.text = text
    }
    
       
        
        
    
    
    
}
