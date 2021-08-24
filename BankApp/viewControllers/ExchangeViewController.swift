//
//  AccountsVieControllers.swift
//  BankApp
//
//  Created by Andrey on 05.08.2021.
//

import UIKit

class ExchangeViewController: UIViewController {
    
    let networkManager = NetworkService()
    let tableView = UITableView()
    var exchanges: [CurrencyExchangeModel] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
        isHidden()
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "exchangeCell")
        tableView.dataSource = self
        tableView.delegate = self
        networkManager.request {[weak self] currency in
            DispatchQueue.main.async {
                guard let currency = currency else { return }
                self?.exchanges = currency
                print(currency)
                self?.tableView.reloadData()
            }
         
          
            
            
        }
       
    }

    
    
}

extension ExchangeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return exchanges.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exchangeCell", for: indexPath)
        let currency = exchanges[indexPath.row]
        cell.imageView?.image = UIImage(named: currency.cc.lowercased())
        cell.textLabel?.text = "\(currency.txt) - \(currency.rate) грн"
        return cell
    }


}
