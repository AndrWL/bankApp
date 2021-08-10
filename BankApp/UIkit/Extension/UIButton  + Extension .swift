//
//  UIButton  + Extension .swift
//  BankApp
//
//  Created by Andrey on 05.08.2021.
//

import UIKit

extension UIButton {
    
    convenience init(backgroundColor: UIColor, titleColor: UIColor, cornerRadius: CGFloat) {
        
        self.init(type: .system)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = cornerRadius
    }
    
    
    
}
