//
//  AccountManager.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation

class AccountManager {
    
    static let shared = AccountManager()
    
    // Acounts
    var accounts = [Account]()
    var selectedAccount : Account?
    
    
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
