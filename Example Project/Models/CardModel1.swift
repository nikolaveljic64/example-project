//
//  DataType1.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation

struct CardModel1 {
    var title: String!
    var description: String!
    var active: Bool!
}

var dammyCardModelOne = CardModel1(title: "Title 5", description: "Description 5", active: false)
var dammyCardModelTwo = CardModel1(title: "Title 6", description: "Description 6", active: false)


var arrayCardModel = [ CardModel1(title: "Title 1", description: "Description 1", active: false),
                      CardModel1(title: "Title 2", description: "Description 2", active: true)]
