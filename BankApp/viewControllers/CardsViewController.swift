//
//  ViewController.swift
//  BankApp
//
//  Created by Andrey on 31.07.2021.
//

import UIKit



class CardsViewController: UIViewController {

    var isFliped = true
    var currentCard: CardModel!
    var balance = UILabel(text: "Balance")
    var tableView = UITableView()
    let flipCardImage = UIImageView()
    var conteinerView  = UIImageView()
    private let flipButton = UIButton()
    private let addCardButtom = UIButton(backgroundColor: .darkGray, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 10)
    var cards: [CardModel] = [CardModel(cardImage: "card_1", balance: 1000, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
        TransActionStory(sum: 10, comment: "healthy"),
        TransActionStory(sum: 110, comment: "study")]),
                              
        CardModel(cardImage: "card_2", balance: 2000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
        TransActionStory(sum: 10, comment: "healthy"),
        TransActionStory(sum: 110, comment: "study")]),
        CardModel( cardImage: "card_1", balance: 50000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
            TransActionStory(sum: 10, comment: "healthy"),
            TransActionStory(sum: 110, comment: "study")]),
       
    ]
    var currentCardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .darkGray
        
        currentCard = cards.first
        balance.text = "\(currentCard.balance) $"
        
        setupCardImageViews()
        setupButtons()
        setupLabel()
        
        setupFlipButton()
        setConstraints()
        
        setupTableView()
         isHidden()
        
       
        
      
        
      
}
    
  
    
   private func setupButtons() {
    
    view.addSubview(addCardButtom)
    
  
    addCardButtom.translatesAutoresizingMaskIntoConstraints = false
    
    let imageButtom = UIImage(systemName: "plus.rectangle.on.rectangle")
  
    addCardButtom.setBackgroundImage(imageButtom, for: .normal)
    addCardButtom.tintColor = .lightGray
    addCardButtom.addTarget(self, action: #selector(addCard), for: .touchUpInside)
    
    
    }
    private func setupCardImageViews() {
        
        currentCardImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        guard let currentCardImage = currentCardImage else { return  }
        currentCardImage.image = UIImage(named: "\(currentCard.cardImage)")
        
        currentCardImage.translatesAutoresizingMaskIntoConstraints = false
        currentCardImage.clipsToBounds = true
        currentCardImage.layer.cornerRadius = 7
       
        
       
       
        conteinerView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
       
        view.addSubview(currentCardImage)
        
       
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        //conteinerView.addSubview(currentCardImage)
        
    }
    private func setupTableView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 350, width: view.frame.width, height: view.frame.height/2))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTransAcrion")
        view.addSubview(tableView)
        
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupLabel() {
        balance.font = UIFont(name: "Avenir", size: 30)
        balance.tintColor = .lightGray
        
        balance.frame = CGRect(x: 0, y: 200, width: 100, height: 50)
        view.addSubview(balance)
        balance.translatesAutoresizingMaskIntoConstraints = false
    }
    private func setupFlipButton() {
      
      
        
        flipButton.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        flipButton.addTarget(self, action: #selector(tapToflip), for: .touchUpInside)
        
        view.addSubview(flipButton)
        flipButton.translatesAutoresizingMaskIntoConstraints = false
    }
    @objc private func addCard() {
        
        let cardSelectionViewController = CardSelectionViewController()
        cardSelectionViewController.cards = cards
    
        self.present(cardSelectionViewController, animated: true)
    }
    
    @objc private func tapToflip() {
        
        guard let currentCardImage = currentCardImage else { return  }
        
        guard let BackImageimage = UIImage(named: "\(currentCard.cardImage)flip") else { return }
        guard  let frontImage = UIImage(named: "\(currentCard.cardImage)") else {
            return
        }


        if isFliped {
            print("first")
            UIView.transition(with: currentCardImage, duration: 0.8, options: .transitionFlipFromLeft) {
                currentCardImage.image = BackImageimage
                self.isFliped = false
                
            }
    } else {
        print("2nd")
        UIView.transition(with: currentCardImage, duration: 0.8, options: .transitionFlipFromLeft) {
        
       
            currentCardImage.image = frontImage
             self.isFliped.toggle()
        }
    }
}
    
        
    private func setConstraints() {
        NSLayoutConstraint.activate([
            addCardButtom.widthAnchor.constraint(equalToConstant: 30),
            addCardButtom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            addCardButtom.topAnchor.constraint(equalTo: view.topAnchor, constant: +40),
            addCardButtom.heightAnchor.constraint(equalTo: addCardButtom.widthAnchor),
         
    ])
        guard let currentCardImage = currentCardImage else { return  }
        
        NSLayoutConstraint.activate([currentCardImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
                                     currentCardImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     currentCardImage.widthAnchor.constraint(equalToConstant: 300),
                                     currentCardImage.heightAnchor.constraint(equalToConstant: 200)])
     
        
        NSLayoutConstraint.activate([balance.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), balance.topAnchor.constraint(equalTo: addCardButtom.topAnchor)])
           
        
        NSLayoutConstraint.activate([flipButton.widthAnchor.constraint(equalToConstant: currentCardImage.frame.width),
                                     flipButton.heightAnchor.constraint(equalToConstant: currentCardImage.frame.height-50), flipButton.centerYAnchor.constraint(equalTo: currentCardImage.centerYAnchor),
                                     flipButton.centerXAnchor.constraint(equalTo: currentCardImage.centerXAnchor)])
        
        
//        NSLayoutConstraint.activate([currentCardImage!.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
//                                     currentCardImage!.centerYAnchor.constraint(equalTo: conteinerView.centerYAnchor),
//                                     currentCardImage!.widthAnchor.constraint(equalTo: conteinerView.widthAnchor),
//                                     currentCardImage!.heightAnchor.constraint(equalTo: conteinerView.heightAnchor)])
        
    }
    
    deinit {
        print("collection delete")
    }
   
}

extension CardsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
            let counts = currentCard.transActionStory.map({$0.sum})
            
            return counts.count
      
          
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTransAcrion", for: indexPath)
        
        let currentsTransActions = currentCard.transActionStory[indexPath.row]
        cell.textLabel?.text = "\(currentsTransActions.comment) - \(currentsTransActions.sum) "
        
        cell.backgroundColor = .black
        return cell
    }
    
    
}








