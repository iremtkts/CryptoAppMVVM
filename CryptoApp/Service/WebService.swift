//
//  WebService.swift
//  CryptoApp
//
//  Created by iremt on 22.03.2023.
//

import Foundation


class WebService {
    
    func downloadCurrencies(url : URL , completion : @escaping([CryptoCurrency]?) ->()) {
        // Cryptocurrency bir dizi içinde gelecek optional olmalı void döndürcek
        
        URLSession.shared.dataTask(with: url) { data , response , error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
