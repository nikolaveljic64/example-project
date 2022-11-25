//
//  CardType1CellController.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit


class CardType1CellController: CellController {
   
    private var model: CardModel

    init(model: CardModel) {
        self.model = model
    
    }
    
    static func configure(tableView: UITableView) {
        tableView.register(CardCell.nib, forCellReuseIdentifier: CardCell.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardCell.cellIdentifier, for: indexPath) as! CardCell
        cell.didToggleStatus = { [weak self] in
            self?.model.active.toggle()
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        cell.configCell(item: model)
        return cell
    }
}
