//
//  BanerCellController.swift
//  Example Project
//
//  Created by Nikola Veljic on 25.11.22..
//

import UIKit


protocol BannerCellControllerCellProtocol: AnyObject {
    func didTapHide(indexPath: IndexPath)
}

class BannerCellController: CellController {
   
    private var model: BannerModel?
   
    weak private var delegate: BannerCellControllerCellProtocol?
    
    init(model: BannerModel, delegate: BannerCellControllerCellProtocol?) {
        self.model = model
        self.delegate = delegate
    }
   
    static func configure(tableView: UITableView) {
        tableView.register(BannerCell.nib, forCellReuseIdentifier: BannerCell.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.cellIdentifier, for: indexPath) as! BannerCell
        cell.configCell(item: model, indexPath: indexPath)
               
        cell.didTapHide = { [weak self] _ in
            self?.delegate?.didTapHide(indexPath: indexPath)
        }
        
        return cell
    }
    
}
