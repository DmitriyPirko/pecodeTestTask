//
//  NetworkManager.swift
//  test
//
//  Created by Dmitriy on 16.02.2021.
//  b138b1a89e664855b6158ad1dba367ee

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    var urlBasic = "http://newsapi.org/v2/top-headlines?"
    var urlCountry = "country=us&"
    var urlApiKey = "apiKey=b138b1a89e664855b6158ad1dba367ee"
    
    func fetchNewsData(with completion: @escaping ((NewsItem?) -> ())){
        let urlString = urlBasic + urlCountry + urlApiKey
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let jsondata = try JSONDecoder().decode(NewsItem.self, from: data)
                print("Get URL Session")
                completion(jsondata)
            } catch let jsonErr{
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
}
