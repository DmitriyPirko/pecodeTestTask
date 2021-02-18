//
//  MainViewControllerExtension.swift
//  test
//
//  Created by Dmitriy on 18.02.2021.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        StorageManager.sharedManager.news.first?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as? TableViewCell {
            cell.idLabel.text = StorageManager.sharedManager.news.first?.articles[indexPath.row].source.id
            cell.nameLabel.text = StorageManager.sharedManager.news.first?.articles[indexPath.row].source.name
            cell.authorLabel.text = StorageManager.sharedManager.news.first?.articles[indexPath.row].author
            cell.titleLabel.text = StorageManager.sharedManager.news.first?.articles[indexPath.row].title
            cell.descriptionLabel.text = StorageManager.sharedManager.news.first?.articles[indexPath.row].description
            if let url = StorageManager.sharedManager.news.first?.articles[indexPath.row].urlToImage {
                cell.picture.downloaded(from: url)
            }
            return cell
        } else {
            return TableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        StorageManager.sharedManager.selectedNew = indexPath.row
        performSegue(withIdentifier: "detailedNewsSegue", sender: Any?.self)
    }
}
