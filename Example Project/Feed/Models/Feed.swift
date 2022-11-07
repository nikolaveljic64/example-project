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
    var shops: [ShopItem]?
    var post: PostItem?
    var posts: [PostItem]?
    var swfModel: SwfMainModel?
}

extension Feed {
    init(type: FeedDataType) {
        self.type = type
    }
}
