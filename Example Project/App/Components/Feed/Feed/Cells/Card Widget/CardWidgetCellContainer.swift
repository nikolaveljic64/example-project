//
//  CardWidgetCellContainer.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit

class CardWidgetCellCellController: CellController {
   
    private var items: [CardModel]

    init(items: [CardModel]?) {
        self.items = items ?? []
    
    }
    
    static func configure(tableView: UITableView) {
        tableView.register(CardWidget.nib, forCellReuseIdentifier: CardWidget.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardWidget.cellIdentifier, for: indexPath) as! CardWidget
        cell.configCell(items: items)
        return cell
    }
}
