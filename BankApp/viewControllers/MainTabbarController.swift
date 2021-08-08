//
//  MainTabBarController.swift
//  BankApp
//
//  Created by Andrey on 05.08.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       
     
        
        
        let cardsViewController = CardsViewController()
        let accountViewController = AccountVieController()
        let moreViewController = MoreViewController()
        
       
        let boldConfig = UIImage.SymbolConfiguration(weight: .heavy)
        let cardImage = UIImage(systemName: "creditcard.fill", withConfiguration: boldConfig)!
        let accountImage = UIImage(systemName: "person.crop.circle", withConfiguration: boldConfig)!
        let moreImage = UIImage(systemName: "ellipsis.circle", withConfiguration: boldConfig)!
        
        viewControllers = [ generateNavigationViewcontroller(rootViewController: cardsViewController, title: "Cards", image: cardImage), generateNavigationViewcontroller(rootViewController: accountViewController, title: "account", image: accountImage), generateNavigationViewcontroller(rootViewController: moreViewController, title: "more", image: moreImage)
            
        ]
    }
    
    private func generateNavigationViewcontroller(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC  = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
      
        return navigationVC
    }

}



import SwiftUI

struct MainTabBarControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabbar = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some MainTabBarController {
            return tabbar
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}
