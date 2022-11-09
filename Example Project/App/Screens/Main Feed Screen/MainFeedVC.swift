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
        self.title = "Main Feed for \(AccountManager.shared.selectedAccount?.name ?? "")"
        self.mainFeedVM.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        // Main feed
        case "mainFeedToFeed":
            if let feedVC = segue.destination as? FeedVC {
                self.feedVC = feedVC
                self.feedVC.feedType = .mainCardFeed
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
        self.feedVC.loadData()
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
