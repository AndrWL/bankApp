//
//  TextFieldView.swift
//  BankApp
//
//  Created by Andrey on 05.08.2021.
//

import UIKit



extension UITextField {
    convenience init(backgroundColor: UIColor, placeholder: String, borderStyle: UITextField.BorderStyle, textColor: UIColor) {
        self.init()
        
      
        self.backgroundColor = backgroundColor
        self.placeholder = placeholder
        self.borderStyle = borderStyle
    }
}

