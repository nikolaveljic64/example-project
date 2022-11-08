//
//  DataType1.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation

struct CardModel {
    var title: String!
    var description: String!
    var active: Bool!
}

var dammyCardModelOne = CardModel(title: "Title 5", description: "Description 5", active: false)
var dammyCardModelTwo = CardModel(title: "Title 6", description: "Description 6", active: false)
var dammyCardModelThree = CardModel(title: "Title 7", description: "Description 8", active: false)


var arrayCardModel = [ CardModel(title: "Title 1", description: "Description 1", active: false),
                      CardModel(title: "Title 2", description: "Description 2", active: true)]
