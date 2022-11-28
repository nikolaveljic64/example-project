//
//  MainFeedVC.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class MainFeedVC: UIViewController {
    
    var mainFeedVM = MainFeedVM()
    var feedVC: FeedVC!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main Feed for \(Manager.shared.selectedAccount?.name ?? "")"
        self.mainFeedVM.delegate = self
        
        BannerCellController.configure(tableView: feedVC.tableView)
        CardType1CellController.configure(tableView: feedVC.tableView)
        CardType2CellController.configure(tableView: feedVC.tableView)
        CardWidgetCellCellController.configure(tableView: feedVC.tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        // Main feed
        case "mainFeedToFeed":
            if let feedVC = segue.destination as? FeedVC {
                self.feedVC = feedVC
                let feedVM = FeedVM()
                self.feedVC.loadData = { feedVM.getData(self: feedVC) }
                feedVM.completion = { [weak feedVC] data in
                    feedVC?.set(data: data)
                }
            }
        default: break
        }
    }
    
    @IBAction func didTapAccounts(_ sender: UIBarButtonItem) {
        mainFeedVM.openAccount(self)
    }
}

extension MainFeedVC: AccountVCProtocol {
    func didSelect(_ account: Account) {
        self.title = "Main Feed for \(account.name ?? "")"
    }
}

extension MainFeedVC: VCProtocol {
    func inProgress(action: Action?) {
        
    }
    
    func onSuccess(data: Any?, action: Action?) {
        
    }
    
    func onError(error: Error, action: Action?) {
        
    }
}
