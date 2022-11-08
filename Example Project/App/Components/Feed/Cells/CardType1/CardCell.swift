//
//  CardCell.swift
//  Example Project
//
//  Created by Nikola Veljic on 7.11.22..
//

import UIKit

class CardCell: UITableViewCell {

    static var cellIdentifier = "CardCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var containerView: UIView!
    
    weak var delegate: CellProtocol!
    var indexPath: IndexPath?
    var item: CardModel1?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(item: CardModel1?) {
        guard let item else { return }
        
        self.titleLabel.text = item.title
        item.active ? (statusLabel.text = "Active") : (statusLabel.text = "Not Active")
        statusSwitch.isOn = item.active
        
    }
    
    @IBAction func didTapStatusSwitch(_ sender: UISwitch) {
        delegate.didSelect(indexPath: indexPath, action: .toogleStatus, data: item)
    }
}
