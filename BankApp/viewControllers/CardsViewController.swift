//
//  ViewController.swift
//  BankApp
//
//  Created by Andrey on 31.07.2021.
//

import UIKit



class CardsViewController: UIViewController {

    

    var isFlipped = true
    var currentCard: CardModel!
    var balance = UILabel(text: "Balance")
    var tableView = UITableView()
    let flipCardImage = UIImageView()
    var conteinerView  = UIImageView()
    let cardsAnimation = CardAnimation()
    
    
    private let flipButton = UIButton()
    private let addCardButtom = UIButton(backgroundColor: .darkGray, titleColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cornerRadius: 10)
    var cards: [CardModel] = [CardModel(cardImage: "black", balance: 4560, transActionStory: [TransActionStory(sum: 30, comment: "eat"),     TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 720, comment: "work"),
        TransActionStory(sum: 330, comment: "healthy"),
        TransActionStory(sum: 120, comment: "study")]),
                              
        CardModel(cardImage: "white", balance: 200, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work"),
        TransActionStory(sum: 10, comment: "healthy"),
        TransActionStory(sum: 110, comment: "study")]), CardModel(cardImage: "grey", balance: 20000, transActionStory: [TransActionStory(sum: 30, comment: "eat"), TransActionStory(sum: 50, comment: "sport"), TransActionStory(sum: 70, comment: "work")])
     
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        
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
       
        view.addSubview(currentCardImage)
        
        
    }
    private func setupTableView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 350, width: view.frame.width, height: view.frame.height/2))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTransAcrion")
        view.addSubview(tableView)
        
        tableView.backgroundColor = .white
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
        cardSelectionViewController.modalPresentationStyle = .fullScreen
        cardSelectionViewController.cards = cards
        
        cardSelectionViewController.currentCardDelegate = self
        self.present(cardSelectionViewController, animated: true)
        
        
       
    }
    
    
    
    
    @objc private func tapToflip() {
        
        cardsAnimation.creatAnimation(image: currentCardImage, model: currentCard)
        
        
        
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
        cell.textLabel?.text = "\(currentsTransActions.comment) - \(currentsTransActions.sum) $"
        
        cell.backgroundColor = .black
        
        return cell
    }
    
    
}

extension CardsViewController: SelectedCardDelegate {
    func getCard(selectedCard: CardModel) {
        DispatchQueue.main.async {
            self.currentCard = selectedCard
            self.balance.text = "\(self.currentCard.balance)"
    
            self.currentCardImage.image = UIImage(named: self.currentCard.cardImage)
            self.tableView.reloadData()
            
            
         
      
         
        }

        
    }
    
    
}
    










