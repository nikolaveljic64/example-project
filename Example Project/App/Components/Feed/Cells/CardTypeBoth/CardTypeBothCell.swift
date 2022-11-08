//
//  CardTypeBothCell.swift
//  Example Project
//
//  Created by Nikola Veljic on 8.11.22..
//

import UIKit

class CardTypeBothCell: UITableViewCell {
    
    static var cellIdentifier = "CardTypeBothCell"
    
    // Based on screen in future
    enum CellType {
        case cardType1
        case cardType2
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func configCell(item: CardModel1?, type: CellType = .cardType2) {
        
        guard let item else { return }
        
        titleLabel.text = item.title
        item.active ? (statusLabel.text = "Active") : (statusLabel.text = "Not Active")
        statusSwitch.isOn = item.active
        
        iconImage.isHidden = type == .cardType2
        statusSwitch.isHidden = type == .cardType2
        containerView.backgroundColor = (type == .cardType2) ? (.secondarySystemBackground) : (.systemBackground)
    }
}
