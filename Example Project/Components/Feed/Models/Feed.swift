//
//  Feed.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation

struct Feed {
    var type: FeedDataType!
    // Data
    var cardType1: CardType1?
}

extension Feed {
    init(type: FeedDataType) {
        self.type = type
    }
}
