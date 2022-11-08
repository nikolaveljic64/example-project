//
//  CardCollection.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import Foundation

/// Screen Type
enum CardCollectionType {
    case mainFeed
}

//MARK: VC
protocol CardCollectionVCProtocol: AnyObject {
    func inProgress(action: CardCollectionVCAction?)
    func onSuccess(data: Any?, action: CardCollectionVCAction?)
    func onError(error: Error, action: CardCollectionVCAction?)
}

enum CardCollectionVCAction {
    
}

//MARK: CELL

protocol CardCollectionCellProtocol: AnyObject {
    func didSelect(indexPath: IndexPath?, action: CardCollectionCellAction, data: Any?)
}

/// Cell Action
enum CardCollectionCellAction {
    case toogleStatus
}
