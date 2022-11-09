//
//  AccountFeedVC.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import UIKit

/// Example for other Feed
class AccountFeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Private variables
    private var data: [AccountFeed] = []
    private let accountFeedVC = FeedVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        accountFeedVC.delegate = self
        
    }

}

extension AccountFeedVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


extension AccountFeedVC: VCProtocol {
    
    func inProgress(action: Action?) {
        
    }
    
    func onSuccess(data: Any?, action: Action?) {
        switch action {
        case .getData:
            if let data = data as? [AccountFeed] {
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
