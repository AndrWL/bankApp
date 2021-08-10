//
//  CardCell.swift
//  BankApp
//
//  Created by Andrey on 03.08.2021.
//

import UIKit


class CardCell: UICollectionViewCell{
    
    static let identifier = "cellId"
    var image = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = self.superview?.backgroundColor
        self.loadImage()
    }
    
    
    func loadImage() {
        image = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height))
        contentView.addSubview(image)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
