//
//  FeedVC.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class FeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var feedType: FeedType!
    
    // Private variables
    private var data: [Feed] = []
    private let feedVM = FeedVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CardCell.nib, forCellReuseIdentifier: CardCell.cellIdentifier)
        
        feedVM.delegate = self
        
        loadData()
    }
    
    func loadData() {
        feedVM.getData()
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
        switch data[indexPath.row].type {
        case .cardType1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CardCell.cellIdentifier, for: indexPath) as? CardCell {
                return cell
            }
            
        default: break
        }
        
        return UITableViewCell()
    }
}

extension FeedVC: VCProtocol {
    
    func inProgress(action: Action?) {
        
    }
    
    func onSuccess(data: Any?, action: Action?) {
        switch action {
        case .getData:
            if let data = data as? [Feed] {
                self.data = data
                self.tableView.reloadData()
            }
        default: break
        }
    }
    
    func onError(error: Error, action: Action?) {
        print(error.localizedDescription)
    }
    
    
}
