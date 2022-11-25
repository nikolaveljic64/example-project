//
//  BanerCellController.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit


class BannerCellController: CellController {
   
    private var model: BannerModel?

    init(model: BannerModel) {
        self.model = model
    
    }
    
    static func configure(tableView: UITableView) {
        tableView.register(BannerCell.nib, forCellReuseIdentifier: BannerCell.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.cellIdentifier, for: indexPath) as! BannerCell
        cell.configCell(item: model)
        return cell
    }
}
