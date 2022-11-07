//
//  MainFeedVC.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class MainFeedVC: UIViewController {
    
    var feedVC: FeedVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
}
