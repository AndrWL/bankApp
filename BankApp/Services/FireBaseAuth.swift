//
//  FireBaseAuth.swift
//  BankApp
//
//  Created by Andrey on 20.08.2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class AuthService {
    
    static let shared = AuthService()
    private  let auth = Firebase.Auth.auth()
    
    func register(email: String?, password: String?, complition: @escaping(Result<User, Error>) -> Void) {
        
        auth.createUser(withEmail: email!, password: password!) { result, error in
            guard let result = result else { complition(.failure(error!))
                return }
            
            complition(.success(result.user))
        }
    }
    func login(email: String?, password: String?, complition: @escaping(Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email!, password: password!) { [weak self] result, error in
            
            guard let result = result else { complition(.failure(error!))
                return
            }
            complition(.success(result.user))
        }
            
    }
    deinit {
        print("deinit AuthService")
    }
}
