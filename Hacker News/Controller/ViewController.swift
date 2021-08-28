//
//  ViewController.swift
//  Hacker News
//
//  Created by Khater on 8/28/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataManager = DataManager()
    var selectedRow: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.fetchData {
            self.tableView.reloadData()
        }
        
        title = Constants.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
    }
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! PostCell
        
        cell.idLabel.text = String(dataManager.posts[indexPath.row].points)
        cell.postLabel.text = dataManager.posts[indexPath.row].title
        return cell
    }
}


//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        self.performSegue(withIdentifier: Constants.webIdentifier, sender: self)
    }
}

//MARK: - performSegue
extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == Constants.webIdentifier{
            // Pass the selected object to the new view controller.
            let destinationVC = segue.destination as! WebVC
            if let row = selectedRow{
                destinationVC.urlString = dataManager.posts[row].url
            }
        }
    }
}
