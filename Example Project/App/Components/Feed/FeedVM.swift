//
//  FeedVM.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation


class FeedVM {
    
    weak var delegate: VCProtocol!
    
    func getData() {
    
        delegate.inProgress(action: .getData)
    
        // Example we can use multiple account
        // Based on that id we will get data
        // That data we will get from API
        
        var data: [Feed] = []
        
    
        // This can be load from API
        for item in arrayCardType {
            data.append(Feed(type: .cardType1, cardType1: item))
        }
        
        // This can be load from API
        data.append(Feed(type: .cardType2, cardType2: dammyCardType2Object1))
        data.append(Feed(type: .cardType2, cardType2: dammyCardType2Object2))
        
        
        delegate.onSuccess(data: data, action: .getData)
        
    }
    
}
