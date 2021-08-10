//
//  MainTabBarController.swift
//  BankApp
//
//  Created by Andrey on 05.08.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let logOutButton = UIButton(backgroundColor: .darkGray, titleColor: .white, cornerRadius: 10)
    
    let cardsViewController = CardsViewController()
    let accountViewController = AccountVieController()
    let moreViewController = MoreViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        isHidden()
        view.backgroundColor = .darkGray
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
       
     
        
        
       
        let boldConfig = UIImage.SymbolConfiguration(weight: .heavy)
        let cardImage = UIImage(systemName: "creditcard.fill", withConfiguration: boldConfig)!
        let accountImage = UIImage(systemName: "person.crop.circle", withConfiguration: boldConfig)!
        let moreImage = UIImage(systemName: "ellipsis.circle", withConfiguration: boldConfig)!
        
        viewControllers = [ generateNavigationViewcontroller(rootViewController: cardsViewController, title: "Cards", image: cardImage), generateNavigationViewcontroller(rootViewController: accountViewController, title: "account", image: accountImage), generateNavigationViewcontroller(rootViewController: moreViewController, title: "more", image: moreImage)
            
        ]
        setupLogOutButton()
        
       
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    
    private func setupLogOutButton() {
        
       
        
        view.addSubview(logOutButton)
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        let imageLogOutButton = UIImage(systemName: "person.crop.circle.fill.badge.minus")
        logOutButton.setBackgroundImage(imageLogOutButton, for: .normal)
        logOutButton.tintColor = .lightGray
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        
        NSLayoutConstraint.activate([logOutButton.heightAnchor.constraint(equalToConstant: 30), logOutButton.widthAnchor.constraint(equalToConstant: 30), logOutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20), logOutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: +38   )])
    }
    
    private func generateNavigationViewcontroller(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationVC  = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
      
        navigationVC.tabBarItem.image = image
      
        return navigationVC
    }
    
    
    @objc private func logOut() {
        
        
        self.navigationController?.popToRootViewController(animated: true)
    
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
       
        if item.title == "Cards" {
            logOutButton.isHidden = false
        } else {
            logOutButton.isHidden = true
        }
        
      
        
    }
    deinit {
        print("Main Удален")
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
