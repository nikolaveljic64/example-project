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
    var cardType1: CardModel?
    var cardType2: CardModel?
    var cardType: CardModel?
    var banner: BannerModel?
    
    var cardArrays: [CardModel]?
}

extension Feed {
    init(type: FeedDataType) {
        self.type = type
    }
}
