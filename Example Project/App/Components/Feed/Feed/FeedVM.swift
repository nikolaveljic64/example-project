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
        
    
        // dispatchGroup for waiting for all API to finish
        
        // API different for ID
        if AccountManager.shared.selectedAccount?.id == 1 {
            // First Type
            data.append(Feed(type: .cardType1, cardType1: dummyArrayCardModel.first))
        } else {
            for item in dummyArrayCardModel {
                data.append(Feed(type: .cardType1, cardType1: item))
            }
           
        }
        
        // This can be load from API
        // Secont Type
        // And other API which can load other cards but for different purpose
        data.append(Feed(type: .cardType2, cardType2: dummyCardModelOne))
        
        
        // Both Types , some logic to separate those two card , maybe with field inside object or based on screen
        data.append(Feed(type: .cardTypeBoth, cardType: dummyCardModelTwo))
        
        // Both Types , some logic to separate those two card , maybe with field inside object or based on screen
        data.append(Feed(type: .cardTypeBoth, cardType: dummyCardModelThree))
        
        
        // Collection View
        data.append(Feed(type: .collectionViewEmbeded, cardArrays: dummyArray2CardModel))
     
        delegate.onSuccess(data: data, action: .getData)
        
    }
    
}
