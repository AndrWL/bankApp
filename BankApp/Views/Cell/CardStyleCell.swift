//
//  CardStyleCell.swift
//  BankApp
//
//  Created by Andrey on 24.08.2021.
//

import UIKit


class CardStyleCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateUIElements()
     
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUIElements() {
        contentView.layer.cornerRadius = 10
        contentView.addSubview(cardImage)
        contentView.addSubview(cardDescription)
        
        cardDescription.textColor = .white
        cardDescription.numberOfLines = 0
        cardImage.contentMode = .scaleAspectFit
       
        cardDescription.translatesAutoresizingMaskIntoConstraints = false
        cardImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var cardImage = UIImageView()
    var cardDescription = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

        constraints()
        
        
    }
    func constraints()  {
        
        NSLayoutConstraint.activate([cardImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -100), cardImage.heightAnchor.constraint(equalToConstant: (contentView.frame.height/3)), cardImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), cardImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50)])
       
        NSLayoutConstraint.activate([cardDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),cardDescription.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16), cardDescription.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)])
    }
    
    public func configureCell(cardsModel: CardModel) {
        cardImage.image = UIImage(named: cardsModel.cardImage)
        cardDescription.text = cardsModel.cardDescription
        
    }
}
