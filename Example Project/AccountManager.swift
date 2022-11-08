//
//  AccountManager.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation

class AccountManager {
    
    static let shared = AccountManager()
    
    var accounts = [Account]()
    
    var selectedAccount : Account?
    
    
    private init() { }
    
    func onStart() {
        /// Load accounts on oppening screen
        self.accounts = dummyAccounts
        
        
        // Get from Database or something
        self.selectedAccount = self.accounts.first
    }
    
}
