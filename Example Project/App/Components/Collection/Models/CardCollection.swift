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
    func didSelect(indexPath: IndexPath?, action: CardCollectionVCAction?, data: Any?)
}

enum CardCollectionVCAction {
    
}

//MARK: CELL

protocol CardCollectionCellProtocol: AnyObject {
    func didSelect(indexPath: IndexPath?, action: CardCollectionCellAction, data: Any?)
}

/// Cell Action
enum CardCollectionCellAction {

}
