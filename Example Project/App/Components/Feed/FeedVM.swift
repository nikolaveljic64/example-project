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
        
    
        //dispatchGroup for waiting for all API to finish
        
        // This can be load from API
        
        // First Type // two count
        for item in arrayCardModel {
            data.append(Feed(type: .cardType1, cardType1: item))
        }
                
        // Secont Type
        // And other API which can load other cards but for different purpose
        data.append(Feed(type: .cardType2, cardType2: dammyCardModelOne))
        
        
        // Both Types , some logic to separate those two card , maybe with field inside object or based on screen
        data.append(Feed(type: .cardTypeBoth, cardType: dammyCardModelOne))
        data.append(Feed(type: .cardTypeBoth, cardType: dammyCardModelTwo))
        
        delegate.onSuccess(data: data, action: .getData)
        
    }
    
}
