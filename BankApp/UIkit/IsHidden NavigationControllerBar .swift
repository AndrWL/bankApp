//
//  IsHidden NavigationControllerBar .swift
//  BankApp
//
//  Created by Andrey on 06.08.2021.
//

import UIKit

extension UIViewController {
    func isHidden() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
