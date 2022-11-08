//
//  AccountFeed.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import Foundation


struct AccountFeed {
    var type: AccountFeedType!
    // Data
    
}

extension AccountFeed {
    init(type: AccountFeedType) {
        self.type = type
    }
}
