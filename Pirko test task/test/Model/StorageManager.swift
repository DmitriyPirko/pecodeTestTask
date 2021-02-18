//
//  StorageManager.swift
//  test
//
//  Created by Dmitriy on 16.02.2021.
//

import Foundation

//protocol WeatherDataStorageManagerDelegate {
//    func onUserDataChanged(userData: [NewsItem])
//}

class StorageManager {
    
    static let sharedManager = StorageManager()
    //let delegate: WeatherDataStorageManagerDelegate? = nil
    var news: [NewsItem] = []
    var selectedNew: Int = 0
    
    func fetchNewsData(with completion: @escaping (NewsItem?) -> ()){
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now(), execute: {
            NetworkManager.shared.fetchNewsData(with: { (model) in
                guard model != nil else {
                    completion(nil)
                    return
                }
                StorageManager.sharedManager.news.removeAll()
                StorageManager.sharedManager.news.append(model!)
                completion(model)
            })
        })
    }
    
}
