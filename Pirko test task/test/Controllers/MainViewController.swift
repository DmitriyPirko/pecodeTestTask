//
//  ViewController.swift
//  test
//
//  Created by Dmitriy on 16.02.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNewsData()
        tableView.delegate = self
        tableView.dataSource = self
        setRefreshControl()
    }
    
    func fetchNewsData() {
        StorageManager.sharedManager.fetchNewsData { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func setRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        fetchNewsData()
    }

}
