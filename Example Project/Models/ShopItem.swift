//
//  ShopItem.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import ObjectMapper

struct ShopItem: Mappable {
    var id: Int?
    var title: String?
    var image: String?
    var coverPictureUrl: String?
    var trusted: Bool? = false
    var voteNumber: Int?
    var averageGrade: Double?
    var logo: String?
    var iAmFollowing: Bool?
    var noOfPosts: Int?
    var followers: Int?
    var rating: Double?
    var description: String?
    var banned: Bool? = false
    var clearanceLevel: Int?
    var isPriceListFileExists: Bool?
    var priceListFileSize: String?
    var priceListFileDescription: String?
    var filePath: String?
    var hasPromoCode: Bool? = false
    var zipCode: String?
    var hasCard: Bool?
    var billing: Bool?
    var profilePictureUrls: ThumbPaths!
    var verified: Bool?
}

extension ShopItem {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        if id == nil {
            id <- map["shopId"]
        }
        hasCard <- map["hasCard"]
        billing <- map["billing"]
        zipCode <- map["zipCode"]
        isPriceListFileExists <- map["isPriceListFileExists"]
        priceListFileSize <- map["priceListFileSize"]
        priceListFileDescription <- map["priceListFileDescription"]
        title <- map["title"]
        if title == nil {
            title <- map["name"]
        }
        if title == nil {
            title <- map["shopName"]
        }
        filePath <- map["filePath"]
        
        image <- map["image"]
        if image == nil {
            image <- map["profilePictureUrl"]
        }
        
        coverPictureUrl <- map["coverPictureUrl"]
        trusted <- map["trusted"]
        verified <- map["verified"]
        voteNumber <- map["voteNumber"]
        averageGrade <- map["averageGrade"]
        logo <- map["logo"]
        
        iAmFollowing <- map["iamFollowing"]
        if iAmFollowing == nil {
            iAmFollowing <- map["following"]
            if iAmFollowing == nil {
                iAmFollowing <- map["isFollowedByThisUser"]
            }
            if iAmFollowing == nil {
                iAmFollowing <- map["followedByThisUser"]
            }
        }
        
        noOfPosts <- map["noOfPosts"]
        if noOfPosts == nil {
            noOfPosts <- map["numberOfPosts"]
        }
        
        followers <- map["followers"]
        if followers == nil {
            followers <- map["numberOfFollowers"]
        }
        
        rating <- map["rating"]
        description <- map["description"]
        banned <- map["banned"]
        clearanceLevel <- map["clearanceLevel"]
        hasPromoCode <- map["hasPromoCode"]
        profilePictureUrls <- map["profilePictureUrls"]
    }
    
    mutating func updateFollowers(count: Int) {
        self.followers = count
    }
}


struct ThumbPaths: Mappable {
    var thumbPath1: String?
    var thumbPath2: String?
    var thumbPath3: String?
}

extension ThumbPaths {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        thumbPath1 <- map["thumb_path1"]
        thumbPath2 <- map["thumb_path2"]
        thumbPath3 <- map["thumb_path3"]
        
        if thumbPath1 == nil {
            thumbPath1 <- map["additionalProp1"]
            thumbPath2 <- map["additionalProp2"]
            thumbPath3 <- map["additionalProp3"]
        }
    }
}
