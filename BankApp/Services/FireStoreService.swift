//
//  File.swift
//  BankApp
//
//  Created by Andrey on 27.08.2021.
//

import UIKit
import Firebase
import FirebaseFirestore

class FireStoreService {
    
    
    static let shared = FireStoreService()
    let db = Firestore.firestore()
    private var userRef: CollectionReference {
        return db.collection("users")
    }
    
    
    
 
    
    
    
    
}
