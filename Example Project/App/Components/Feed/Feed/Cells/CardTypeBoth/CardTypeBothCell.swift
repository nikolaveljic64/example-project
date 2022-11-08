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
    
    weak var delegate: CellProtocol!
    var indexPath: IndexPath?
    var item: CardModel?
    
    private var type: CellType = .cardType2
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func configCell(item: CardModel?, type: CellType = .cardType2) {
        self.item = item
       
        guard let item else { return }
        
        // Example
        if item.description == "Description 8" {
            self.type = .cardType1
        }
        
        titleLabel.text = item.title
        item.active ? (statusLabel.text = "Active") : (statusLabel.text = "Not Active")
        statusSwitch.isOn = item.active
        
        iconImage.isHidden = self.type == .cardType2
        statusSwitch.isHidden = self.type == .cardType2
        containerView.backgroundColor = (self.type == .cardType2) ? (.secondarySystemBackground) : (.opaqueSeparator)
    }
    
    @IBAction func didTapStatusSwitch(_ sender: UISwitch) {
        /// Example where we need to Pass Data , maybe textfield or something
        self.item?.active.toggle()
        
        delegate.didSelect(indexPath: indexPath, action: .toogleStatus, data: item)
    }
    
}
