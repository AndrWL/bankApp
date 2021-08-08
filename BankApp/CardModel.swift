//
//  CardModel.swift
//  BankApp
//
//  Created by Andrey on 03.08.2021.
//

import UIKit

struct CardModel {

    let id = UUID()
    let cardImage: UIImage
    let balance: Int
    let transActionStory: [TransActionStory]
    
}


struct TransActionStory {
    
    let date = Date()
    let sum: Int
    let comment: String
    
 
}







