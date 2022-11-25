//
//  CardType2CellController.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit

class CardType2CellController: CellController {
   
    private var model: CardModel

    init(model: CardModel) {
        self.model = model
    
    }
    
    static func configure(tableView: UITableView) {
        tableView.register(Card2Cell.nib, forCellReuseIdentifier: Card2Cell.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Card2Cell.cellIdentifier, for: indexPath) as! Card2Cell
        cell.configCell(item: model)
        return cell
    }
}
