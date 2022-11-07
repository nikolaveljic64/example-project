//
//  DataType1.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import Foundation

struct CardType1 {
    var title: String!
    var description: String!
    var active: Bool!
}


var dammyCardType1 = CardType1(title: "Title 1", description: "Description 1", active: false)

var arrayCardType = [ CardType1(title: "Title 1", description: "Description 1", active: false),
                      CardType1(title: "Title 2", description: "Description 1", active: true),
                      CardType1(title: "Title 3", description: "Description 1", active: false)]
