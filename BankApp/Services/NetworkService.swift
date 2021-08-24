//
//  NetworkService.swift
//  BankApp
//
//  Created by Andrey on 24.08.2021.
//

import Foundation


class NetworkService {
    
    let urlString = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json"
    
    
    func request(complition: @escaping(([CurrencyExchangeModel]?) -> Void)) {
        guard  let url = URL(string: urlString) else { return }
        
            let session = URLSession(configuration: .default)
          
            let dataTask = session.dataTask(with: url) { data, response, error in
               if let data = data {
                let model = self.fetchData(data: data)
                complition(model)
               } else {
                   print(error?.localizedDescription)
               }
               
               
            }
            dataTask.resume()
     
    }
    
    func fetchData(data: Data) -> [CurrencyExchangeModel]? {
       
        do {
            let model =  try JSONDecoder().decode([CurrencyExchangeModel].self, from: data)
            return model
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}
