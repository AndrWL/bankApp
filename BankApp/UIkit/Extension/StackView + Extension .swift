//
//  StackView + Extension .swift
//  BankApp
//
//  Created by Andrey on 05.08.2021.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UITextField], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
    
}

