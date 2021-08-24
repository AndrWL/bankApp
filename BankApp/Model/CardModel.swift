//
//  CardModel.swift
//  BankApp
//
//  Created by Andrey on 03.08.2021.
//

import UIKit

struct CardModel {

    
    let cardImage: String
    var balance: Double
    let transActionStory: [TransActionStory]
    
}


struct TransActionStory {
    
    let date = Date()
    let sum: Int
    let comment: String
    
 
}







