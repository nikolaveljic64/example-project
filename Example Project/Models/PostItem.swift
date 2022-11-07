//
//  PostItem.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import ObjectMapper
import Foundation

struct PostItem: Mappable {
    var type: PostItemType?
    var id: Int?
    var productId: Int?
    var title: String?
    var description: String?
    var oldPrice: Double?
    var price: Double?
    var discount: Double?
    var published: Date?
    var editorsChoice: Bool?
    var sponsored: Bool?
    var available: Int?
    var validToDate: Date?
    var serviceIds: [Int]?
    var shop: ShopItem?
    var shopImage: String?
    var shopName: String?
    var shopVerified: Bool?
    var link: String?
    var lead: String?
    var enabled: Bool?
    var body: String?
    var thumbnail: String?
    var image: String?
    var blogId: Int?
    var shopId: Int?
    var from: Date?
    var to: Date?
    var number: Int?
    var productImage: String?
    var productName: String?
    var priceBeforeDiscount: Double?
    var inStock: Int?
    var thumbPath1: String?
    var thumbPath2: String?
    var thumbPath3: String?
    var sessionExpiresInSeconds: Int?
    var sessionEndDate: Date?
    var isMySession: Bool?
    var restrictions : String?
    /// Local variables
    var discountPercentage: Int {
        guard let discount = discount else {
            return 0
        }
        // V2 APIs return discount as 0-100
        return Int(String(format: "%.0f", discount < 1 ? round(discount * 100) : discount))!
    }
    
    var swfDetails : SwfMainModel?
}

extension PostItem {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        swfDetails <- map["swfDetails"]
        productId <- map["productId"]
        
        title <- map["title"]
        if title == nil {
            title <- map["name"]
        }
        
        description <- map["description"]
        oldPrice <- map["oldPrice"]
        price <- map["price"]
        discount <- map["discount"]
        published <- (map["published"], DateFormatterTransform(dateFormatter: V2PostMapping.dateFormatter))
        editorsChoice <- map["editorsChoice"]
        sponsored <- map["sponsored"]
        available <- map["available"]
        validToDate <- (map["validToDate"], DateFormatterTransform(dateFormatter: V2PostMapping.dateShortFormatter))
        
        if validToDate != nil {
            validToDate = Calendar.current.date(byAdding: .hour, value: -1, to: validToDate ?? Date())
        }
        
        serviceIds <- map["serviceIds"]
        shop <- map["shop"]
        link <- map["link"]
        lead <- map["lead"]
        enabled <- map["enabled"]
        body <- map["body"]
        thumbnail <- map["thumbnail"]
        image <- map["image"]
        blogId <- map["blogId"]
        shopId <- map["shopId"]
        from <- (map["from"], DateFormatterTransform(dateFormatter: V2PostMapping.dateFormatter))
        to <- (map["to"], DateFormatterTransform(dateFormatter: V2PostMapping.dateFormatter))
        type <- map["type"]
        if type == nil {
            type <- map["postType"]
        }
        
        number <- map["number"]
        productImage <- map["productImage"]
        productName <- map["productName"]
        priceBeforeDiscount <- map["priceBeforeDiscount"]
        inStock <- map["inStock"]
        thumbPath1 <- map["thumbPath1"]
        thumbPath2 <- map["thumbPath2"]
        thumbPath3 <- map["thumbPath3"]
        sessionExpiresInSeconds <- map["sessionExpiresInSeconds"]
        sessionEndDate <- (map["sessionEndDate"], DateFormatterTransform(dateFormatter: V2PostMapping.dateFormatter))
        isMySession <- map["isMySession"]
        restrictions <- map["restrictions"]

    }
}


enum PostItemType: String {
    case cityNews = "CITY_NEWS"
    case newCollection = "NEW_COLLECTION"
    case post = "POST"
    case shoppingEvent = "SHOPPING_EVENT"
    case sharedPost = "SHARED_POST"
    case productPost = "PRODUCT_POST"
    case socialPost = "SOCIAL_POST"
    case shoppingWithFriends = "SHOPPING_WITH_FRIENDS"
}
