//
//  FeedVC.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class FeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var loadData: (() -> Void)?
    
    // Private variables
    private var data: [CellController] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = .init(top: 25, left: 0, bottom: 25, right: 0)
                
        loadData?()
        
    }
    
    func set(data: [CellController]) {
        self.data = data
        self.tableView.reloadData()
    }
 
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let controller = data[indexPath.row]
        return controller.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row].tableView(tableView, didSelectRowAt: indexPath)
    }
}

extension FeedVC: BannerCellControllerCellProtocol {
    func didTapHide(indexPath: IndexPath) {
        self.data.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}
