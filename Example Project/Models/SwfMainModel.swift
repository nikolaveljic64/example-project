//
//  ObjectOneExampleModel.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation
import ObjectMapper

struct SwfMainModel {
    var id: String!
    var shop: ShopItem?
    var city: SwfCity?
    var startDate: Date?
    var endDate: Date?
    var freeItem: SwfShoppingItem?
    var shoppingItems: [SwfShoppingItem]?
    
    var allItems: [SwfShoppingItem]? {
        if var items = self.shoppingItems, let freeItem = self.freeItem {
            items.insert(freeItem, at: 0)
            return items
        }
        return nil
    }
    var shoppingGroups: [SwfShoppingGroup]?
    var canInitiateNewGroup: Bool = false
    var orderOptions: [String]?
    var isCurrentUserInitiator, isCurrentUserJoiner, isCurrentUserParticipating: Bool!
    var maxNumberOfMembers = 0
    var membersCount = 0
    var discountPercentage : Int?
    var finalDiscountPercentage : Int?
    var joinThisPerson : SwfInitiatorJoiner?
    var purchasedItem: SwfShoppingItem?
    var additionalVoucherAmount = 0
}

extension SwfMainModel: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        shop <- map["shop"]
        city <- map["city"]
        startDate <- (map["startDate"], DateFormatterTransform(dateFormatter: V2PostMapping.dateFormatter))
        endDate <- (map["endDate"], DateFormatterTransform(dateFormatter: V2PostMapping.dateFormatter))
        canInitiateNewGroup <- map["canInitiateNewGroup"]
        orderOptions <- map["orderOptions"]
        isCurrentUserInitiator <- map["currentUserInitiator"]
        if isCurrentUserInitiator == nil {
            isCurrentUserInitiator <- map["isCurrentUserInitiator"]
        }
        isCurrentUserJoiner <- map["currentUserJoiner"]
        if isCurrentUserJoiner == nil {
            isCurrentUserJoiner <- map["isCurrentUserJoiner"]
        }
        isCurrentUserParticipating <- map["isCurrentUserParticipating"]
        maxNumberOfMembers <- map["maxNumberOfMembers"]
        membersCount <- map["membersCount"]
        discountPercentage <- map["discountPercentage"]
        shoppingItems <- map["shoppingItems"]
        freeItem <- map["freeItem"]
        purchasedItem <- map["purchasedItem"]
        shoppingGroups <- map["shoppingGroups"]
        joinThisPerson <- map["joinThisPerson"]
        additionalVoucherAmount <- map["additionalVoucherAmount"]
        finalDiscountPercentage <- map["finalDiscountPercentage"]
    }
}

// MARK: - SwfShoppingGroup
struct SwfShoppingGroup {
    var id: String!
    var initiator: SwfInitiatorJoiner?
    var joiners: [SwfInitiatorJoiner]?
    var invitees: [SwfInitiatorJoiner]?
   
    var allUsers: [SwfInitiatorJoiner]? {
        if var joiners = self.joiners, let initiator = self.initiator {
            joiners.insert(initiator, at: 0)
            return joiners
        }
        return nil
    }
}

extension SwfShoppingGroup: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        initiator <- map["initiator"]
        joiners <- map["joiners"]
        invitees <- map["invitees"]
    }
}

// MARK: - SwfInitiatorJoiner
struct SwfInitiatorJoiner {
    var name, nickname: String?
    var profileId: Int?
    var following: Bool?
    var imageUrl: String?
    var isInfluencer : Bool = false
}

extension SwfInitiatorJoiner: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        profileId <- map["profileId"]
        nickname <- map["nickname"]
        following <- map["following"]
        imageUrl <- map["imageUrl"]
        isInfluencer <- map["isInfluencer"]
    }
}

// MARK: - SwfShoppingItem
struct SwfShoppingItem {
    var id: Int!
    var type, name: String?
    var price: Double?
    var quantity: Int?
    var shoppingItemDescription: String?
    var pictureUrls: PictureUrls?
    var description : String?
    var oldPrice: Double?
    var discountPercentage: Int!
}

extension SwfShoppingItem: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        type <- map["type"]
        name <- map["name"]
        quantity <- map["quantity"]
        shoppingItemDescription <- map["description"]
        pictureUrls <- map["pictureUrls"]
        description <- map["description"]
        price <- map["finalPrice"]
        oldPrice <- map["priceBeforeDiscount"]
        discountPercentage <- map["discountInPercentage"]
    }
}

// MARK: - PictureUrls
struct PictureUrls {
    var thumbPath1, thumbPath2, thumbPath3: String?
}
extension PictureUrls: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        thumbPath1 <- map["thumb_path1"]
        thumbPath2 <- map["thumb_path2"]
        thumbPath3 <- map["thumb_path3"]
    }
}

// MARK: - SwfCity
struct SwfCity {
    var id: Int!
    var name, country: String?
}
extension SwfCity: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        country <- map["country"]
    }
}
