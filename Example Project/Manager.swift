//
//  AccountManager.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation



class Manager {
    
    static let shared = Manager()
    
    // Acounts
    /// This is list of account which every user will habe , that means we will always use other ID when we call API
    var accounts = [Account]()
    var selectedAccount : Account? {
        didSet {
            /// Reload on every screen which we have or to use delegate?
            NotificationCenter.default.post(name: .accountSelected, object: nil)
        }
    }
    // Banner used in app
    var banners = [BannerModel]()
    
    private init() { }
    
    func onStart() {
        /// Load accounts on oppening screen
        self.accounts = dummyAccounts
        
        /// Load banners
        self.banners = [dummyBanner1,dummyBanner2,dummyBanner3]
        
        // Get from Database or something
        self.selectedAccount = self.accounts.first
    }
    
}
