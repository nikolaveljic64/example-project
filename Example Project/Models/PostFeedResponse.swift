//
//  PostFeedResponse.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import ObjectMapper


struct PostFeedResponse: Mappable {
    var postType: PostItemType?
    var postPayload: [PostItem]?
    var swfPayload: [SwfMainModel]?
}

extension PostFeedResponse {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        postType <- map["postType"]
        
        switch postType {
        case .post:
            postPayload <- map["payload"]
            
        case .shoppingWithFriends:
            swfPayload <- map["payload"]
        default:
            break
        }
    }
}
